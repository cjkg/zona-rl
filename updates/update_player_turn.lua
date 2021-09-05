function update_player_turn()
	_upd=update_game
	if checkend() then
		doai()
	end
	calcdist(player.x,player.y)
	
	update_hazards()
	step()
	turn+=1
end