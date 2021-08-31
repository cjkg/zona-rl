function heal(mob,hp)
    mob.hp=min(mob.hp+hp,mob.maxhp)
end