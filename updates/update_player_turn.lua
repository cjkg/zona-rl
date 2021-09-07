function update_player_turn()
	_upd=update_game
	if checkend() then
		doai()
	end
	calcdist(player.x,player.y)
	
	step()
	turn+=1
end