function throw()
    local tx,ty=throwtile()
    local mob,effect=getmob(tx,ty),inv[inv_cursor].effect
    if mob then
        sfx(5)
        if effect=="heal" then
            heal(mob,inv[inv_cursor].heal)
        --else
            --todo hitmob(inv[inv_cursor],"throwdmg") local variable for inv[inv_cursor] save tokens?
        end
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