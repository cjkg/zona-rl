function update_shoot()
    player.ani=p_shoot_ani
    if btnp(5) then
        if tt_ammo>0 then
            sfx(6)
            tt_ammo-=1
        else
            sfx(7)
        end
        _upd=update_player_turn
        player.ani=p_ani
    end
end