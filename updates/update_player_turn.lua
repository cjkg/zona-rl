function update_player_turn()
	dobuttonbuff()
	p_t=min(p_t+0.125,1) --desensitizes
	
	if p_t==1 then
		_upd=update_game
		if checkend() then
			doai()
			
		end
		calcdist(player.x,player.y)
		step()
		turn+=1	
		update_hazards()
	end
	
	debug[3]=turn
	
end