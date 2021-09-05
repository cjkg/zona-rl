function drawhud()
    if player.y>=8 then
        hp_y=1
    else
        hp_y=121
    end
    
    rectfill2(0,hp_y-1,40,8,0)
    oprint8("hp: "..player.hp.."/"..player.maxhp.."  markarov: "..ammo,2,hp_y,7,3)    
    --delete/review change color when injured
end