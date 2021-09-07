function addmob(_type,_x,_y)
    local mobinfo=mobobjects[_type]
    local m = {
        x=_x,
        y=_y,
        name=_type,
        hp=mobinfo.hp,
        maxhp=mobinfo.maxhp,
        ani=mobinfo.ani,
        atk=mobinfo.atk,
        task=ai_wait,
        los=mobinfo.los,
        atk_type=mobinfo.atk_type
    }
    add(entities,m)
    return m
end