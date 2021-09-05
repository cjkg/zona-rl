function hitmob(atkm,defm,dmg)
    if not dmg then
        dmg=atkm.atk
    end
    defm.hp-=dmg
    local col=atkm==player and 10 or 8
    addfloat("-"..dmg,defm.x*8-1,defm.y*7,col)
    if defm.hp <=0 then
        del(entities,defm)
    end
end