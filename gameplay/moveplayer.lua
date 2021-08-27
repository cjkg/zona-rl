function moveplayer(dx,dy)
	local destx,desty=p_x+dx,p_y+dy
	local tile=mget(destx,desty)
	p_t=0
	_upd=update_player_turn
	
	if fget(tile,0) and not fget(tile,1) then
		--wall
		--sfx(3)		
	elseif fget(tile,1) then
		bump(tile,destx,desty)
	else
		p_x+=dx
		p_y+=dy
		
		if dx<0 then
			p_flip=true
		elseif dx>0 then
			p_flip=false
		end
		sfx(0)
	end
end