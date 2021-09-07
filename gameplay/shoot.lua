function shoot()
    local tx,ty=throwtile()
    local mob = getmob(tx,ty)
    if mob then
        hitmob(player,mob,3)
    end
    sfx(6)
    ammo-=1
end

function throwtile()
    local tx,ty=player.x,player.y
    repeat
        tx+=throw_dx
        ty+=throw_dy
    until not iswalkable(tx,ty,"checkmobs")
    return tx,ty
end