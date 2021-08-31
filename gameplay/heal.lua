function heal(mob,hp)
    mob.hp=min(mob.hp+hp,mob.maxhp)
    addfloat("+"..hp,mob.x*8,mob.y*8,11)
end