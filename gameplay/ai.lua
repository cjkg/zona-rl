function doai()
    local moving
    for m in all(entities) do
        if m!=player then
            moving=m.task(m)
        end
    end
    if moving then
        _upd=update_ai_turn
    end
end
   
function ai_wait(m)
    if cansee(m,player) then
        m.task,m.tx,m.ty=ai_attack,player.x,player.y
        
        addfloat("!",m.x*8+2,m.y*8,10)
        sfx(3)
    end
end
   
function ai_attack(m) 
    px,py,mx,my=player.x,player.y,m.x,m.y
    if dist(mx,my,px,py)==1 then
        --attack player
        dx,dy=px-mx,py-my
        hitmob(m,player)
        sfx(3)                                                    
    else
        --move to player
        if cansee(m,player) then
            m.tx,m.ty=px,py
        end
        
        if mx==m.tx and my==m.ty then
            m.task=ai_wait
            addfloat("?",mx*8+2,my*8,10)
        else 
            local bdst,bx,by=999,0,0
            calcdist(m.tx,m.ty)
            for i=1,4 do
                local dx,dy=dirx[i],diry[i]
                local tx,ty=mx+dx,my+dy
                if iswalkable(tx,ty,"checkmobs") then
                    local dst=distmap[tx][ty]+rnd()
                    if dst<bdst then
                        bdst,bx,by=dst,dx,dy
                    end
                end
            end
            mobwalk(m,bx,by)
            _upd=update_ai_turn
            --todo: re-aquire target?
        end
    end
end

function mobwalk(mb,dx,dy)
    mb.x+=dx
    mb.y+=dy
end

function cansee(m1,m2)
	return dist(m1.x,m1.y,m2.x,m2.y)<=m1.los and los(m1.x,m1.y,m2.x,m2.y)
end