function update_shoot()
    --delete/review combine with update_throw
    player.ani=p_shoot_ani
    local b=getbutton()
    if b>=0 and b<=3 then
        throw_dir=b
    end
    throw_dx=dirx[throw_dir+1]
    throw_dy=diry[throw_dir+1]
    if btnp(4) then
        _upd=update_game
        player.ani=p_ani
    elseif btnp(5) then
        if ammo>0 then
            shoot()
            _upd=update_player_turn
        else
            sfx(7)
            _upd=update_game
        end
        
        player.ani=p_ani
    end
end