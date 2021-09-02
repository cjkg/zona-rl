function shoot()
    local tx,ty=throwtile()
    local mob = getmob(tx,ty)
    if mob then
        
            hitmob(player,mob,3)
            sfx(6)
            tt_ammo-=1
            debug[5]=mob.hp
        
    end
end

function throwtile()
    local tx,ty=player.x,player.y
    repeat
        tx+=throw_dx
        ty+=throw_dy
    until not iswalkable(tx,ty,"checkmobs")
    return tx,ty
end