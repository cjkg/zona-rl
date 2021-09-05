function hitmob(atkm,defm,dmg)
    if dmg==nil then
        dmg=atkm.atk
    end
    defm.hp-=dmg
    local col=8
    if (atkm==player) col=10
    addfloat("-"..dmg,defm.x*8-1,defm.y*7,col)
    if defm.hp <=    0 then
        del(entities,defm)
    end
end