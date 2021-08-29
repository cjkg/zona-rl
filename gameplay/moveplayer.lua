function moveplayer(dx,dy)
	local destx,desty=player.x+dx,player.y+dy
	local tile=mget(destx,desty)	
	p_t=0
	_upd=update_player_turn
	
	if fget(tile,0) and not fget(tile,1) then
		sfx(2)		
	elseif fget(tile,1) then
		bump(tile,destx,desty)
	elseif getmob(destx,desty) then
		hitmob(player,getmob(destx,desty))
	else
		player.x+=dx
		player.y+=dy
		
		if dx<0 then
			player.flip=true
		elseif dx>0 then
			player.flip=false
		end
		sfx(0)
	end
	refog()
	unfog()	
end