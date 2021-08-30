function draw_inventory_use()
    local use_options=inv[inv_cursor].use_options
    item_y=32
    rectfill2(96,28,32,#use_options*6+8,6)
    rectfill2(98,30,28,#use_options*6+4,5)
    for i=1,#use_options do
        if i==use_cursor then
            spr(79,100+min(sin(time())),item_y,1,1)
        end

        print(use_options[i],104,item_y,7)
        item_y+=7
    end
end