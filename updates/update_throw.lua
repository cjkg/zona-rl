function update_throw()
    local b=getbutton()
    if b>=0 and b<=3 then
        throw_dir=b
    end
    throw_dx=dirx[throw_dir+1]
    throw_dy=diry[throw_dir+1]

    if b==4 then
        _upd=update_game
    elseif b==5 then
        sfx(4)
        throw()
        inv[inv_cursor]=nil
        _upd=update_game
    end
end