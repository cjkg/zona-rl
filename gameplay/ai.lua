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
        m.task=ai_attack
        m.tx,m.ty=player.x,player.y
        
        addfloat("!",m.x*8+2,m.y*8,10)
        sfx(3)
    end
end
   
function ai_attack(m)  
    if dist(m.x,m.y,player.x,player.y)==1 then
     --attack player
        dx,dy=player.x-m.x,player.y-m.y
        hitmob(m,player)
        sfx(3)
        p_t=0                                                       
    else
        --move to player
        if cansee(m,player) then
            m.tx,m.ty=player.x,player.y
        end
        
        if m.x==m.tx and m.y==m.ty then
            m.task=ai_wait
            addfloat("?",m.x*8+2,m.y*8,10)
        else 
            local bdst,bx,by=999,0,0
            calcdist(m.tx,m.ty)
            for i=1,4 do
                local dx,dy=dirx[i],diry[i]
                local tx,ty=m.x+dx,m.y+dy
                if iswalkable(tx,ty,"checkmobs") then
                    local dst=distmap[tx][ty]
                    if dst<bdst then
                        cand={}
                        bdst=dst
                    end
                    if dst==bdst then
                        add(cand,{x=dx,y=dy})
                    end
                end
            end
            if #cand>0 then
                local c=rnd(cand)
                mobwalk(m,c.x,c.y)
            end 
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