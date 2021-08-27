function step()
	if mget(p_x,p_y)==5 then
		genlevel(level+1)
		fadeout()
	end
	if mget(p_x,p_y)==27 then
		addfloat("hooray!",56,64,12)
	end
	if mget(p_x,p_y)==28 then
		fadeout()
		_upd=update_win
		_drw=draw_win
	end
end	