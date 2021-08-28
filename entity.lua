function add_item(_type,_x,_y,_c)
    --local item_info=item_objects[_type]
    local e = {
        x=_x,
        y=_y,
        name=type,
        col=_c,
        item=true
    }   
    add(entities,e)
end

function add_mob(_type,_x,_y,_c)
    --local mob_info=mob_objects[_type]
    local m = {
        x,_x,
        y,_y,
        name=_type,
        col=_c,
        mob=true
    }
    add(entities,m)
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
    I 
]]