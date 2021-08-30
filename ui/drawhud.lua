function drawhud()
    if player.y>=8 then
        hp_y=1
    else
        hp_y=121
    end
    
    rectfill2(0,hp_y-1,40,8,0)
    oprint8("hp: "..player.hp.."/"..player.maxhp.."  tt-33: 8",2,hp_y,11,5)    
    --delete/review change color when injured
end