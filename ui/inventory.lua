function showinventory(cursor)
    if cursor then
        inv_cursor=cursor
    else
        inv_cursor=1
    end
    _upd=update_inventory
    _drw=draw_inventory
end