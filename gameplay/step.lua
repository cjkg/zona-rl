function step()
    local h=gethazard(player.x,player.y)
    if h then
        player.hp+=h.hp
        shake=1
    end
end	