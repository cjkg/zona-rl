function update_inventory_use()
    if btnp(2) then
        use_cursor-=1
    elseif btnp(3) then
        use_cursor+=1
    elseif btnp(4) then
        showinventory(inv_cursor)
    elseif btnp(5) then
        triguse()
    elseif btnp(6) then
        poke(0x5f30,1) 
    end
    use_cursor=inv[inv_cursor] and (use_cursor-1)%#inv[inv_cursor].use_options+1 or 1
end