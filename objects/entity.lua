--[[function additem(_type,_x,_y)
    --local item_info=item_objects[_type]
    local e = {
        x=_x,
        y=_y,
        name=type,
        item=true,
        consumable=item_info.consumable,
        equippable=item_info.equippable,
        throwable=item_info.throwable
    }   
    add(entities,e)
    return
end]]   

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
        atk_type=mobinfo.atk_type,
        hazards=hazard_types[mobinfo.atk_type]
    }
    add(entities,m)
    return m
end


--[[ 
    Map objects 
        Floor trap
        Wall trap 
        Hazard
        Doors
        Locks
        Ladder up
        Ladder down
        Wall
        Trigger
        Floor
        Container
    Mobs
        Monsters
        Player
        Npcs
    Items
        Keys
        Health Spray
        First aid kits
    Instant Bonus (?)

    Bar - the borscht
    Leaving the zone?
    "graying out" explored but not in los
    reacquire target
    I 
]]