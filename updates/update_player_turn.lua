function update_player_turn()
	dobuttonbuff()
	p_t=min(p_t+0.125,1) --desensitizes
	
	if p_t==1 then
		_upd=update_game
		if checkend() then
			doai()
		end
		step()
		
	end
end