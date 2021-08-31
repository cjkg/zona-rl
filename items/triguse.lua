function triguse()
    local verb=inv[inv_cursor].use_options[use_cursor]
    if verb=="trash" then
        inv[inv_cursor]=nil
        showinventory()
    elseif verb=="use" then
        use(inv[inv_cursor],player)
        inv[inv_cursor]=nil
        showinventory()
    elseif verb=="throw" then
        throw(inv[inv_cursor])
        _upd=update_throw
        _drw=draw_game
    end
    update_stats()
end