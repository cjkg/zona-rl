function use(item,mob)
    local effect=item.effect
    if effect=="heal" then
        heal(mob,item.heal)
    end
end