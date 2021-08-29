function hitmob(atkm,defm)
    defm.hp-=atkm.atk
    local col=8
    if (atkm==player) col=10
    addfloat("-"..atkm.atk,defm.x*8-1,defm.y*7,col)
    if defm.hp <= 0 then
        del(entities,defm)
    end
end