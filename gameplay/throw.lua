function throw()
    _upd=update_game
end

function throwtile()
    local tx,ty=player.x,player.y
    repeat
        tx+=throw_dx
        ty+=throw_dy
    until not iswalkable(tx,ty,"checkmobs")
    return tx,ty
end