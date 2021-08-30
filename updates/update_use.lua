function update_inventory_use()
    if btnp(2) then
        use_cursor-=1
    elseif btnp(3) then
        use_cursor+=1
    elseif btnp(4) then
        showinventory(inv_cursor)
    end
    use_cursor=(use_cursor-1)%#inv[inv_cursor].use_options+1
end