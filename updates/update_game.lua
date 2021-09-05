function update_game()
	menuitem(1,"inventory",function() showinventory() end)	
	update_stats()
	dobutton(getbutton())
	checkend()	
end

function checkend()
	if win then
		_upd=update_win
		_drw=draw_win
		fadeout(0.02)
		return false
	elseif player.hp<=0 then
		_upd=update_lose
		_drw=draw_lose
		fadeout(0.02)
		return false
	end
	return true
end