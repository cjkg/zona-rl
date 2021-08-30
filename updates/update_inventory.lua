function update_inventory()
    --delete/review --one function for cursors?
    
    if btnp(2) then
        inv_cursor-=1
    elseif btnp(3) then
        inv_cursor+=1
    elseif btnp(4) then
        _upd=update_game
        _drw=draw_game
    elseif btnp(5) and inv[inv_cursor] then
        showuse(inv_cursor)
    elseif btnp(5) then
        sfx(4)
    end
    inv_cursor=(inv_cursor-1)%slots+1
end

