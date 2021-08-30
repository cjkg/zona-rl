function draw_inventory()
    local c1,c2
    if player.hp>=6 then
        c1=3
        c2=11
    elseif player.hp>=3 then
        c1=9
        c2=10
    else
        c1=8
        c2=9
    end
    rectfill2(0,0,128,128,0)
    rectfill2(34,30,92,59,6)
    rectfill2(36,32,88,55,5)
    --delete/review
	rectfill2(4,36,28,20,6)
    pal(6,c1)
    pal(5,c2)
	spr(76,6,38,3,2)
    pal()
    print(player.hp.."/"..player.maxhp,6,49,7)

    rectfill2(4,58,28,20,6)
    rectfill2(6,60,24,16,12)
    spr(109,4,59,3,2)
    print(tt_ammo,6,71,7)
    print("items",40,36,6)
    local item_y=43
    for i=1,maxslots do
        if i==inv_cursor then
            spr(79,41+min(sin(time())),item_y,1,1)
        end

        if inv[i] then
            print(inv[i].name,50,item_y,7)
        elseif i<=slots then
            print("-",50,item_y,6)
        elseif i<=maxslots then
            print("locked",50,item_y,13)
        end
        item_y+=7
    end
end
