function moveplayer(dx,dy)
	local destx,desty=player.x+dx,player.y+dy
	local tile=mget(destx,desty)
	p_t=0
	_upd=update_player_turn
	
	if fget(tile,0) and not fget(tile,1) then
		--wall
		sfx(2)		
	elseif fget(tile,1) then
		bump(tile,destx,desty)
	else
		player.x+=dx
		player.y+=dy
		
		if dx<0 then
			p_flip=true
		elseif dx>0 then
			p_flip=false
		end
		sfx(0)
	end
end