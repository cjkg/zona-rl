function drawhud()
    if player.y>=8 then
        hp_y=1
    else
        hp_y=121
    end

    oprint8("hp: "..player.hp.."/"..player.maxhp.."  ammo: "..ammo,2,hp_y,7,3)    
    --delete/review change color when injured
end