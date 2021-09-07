function moveplayer(dx,dy)
	local destx,desty=player.x+dx,player.y+dy
	local tile=mget(destx,desty)	

	_upd=update_player_turn
	
	if fget(tile,0) and not fget(tile,1) then
		sfx(2)		
	elseif fget(tile,1) then
		bump(tile,destx,desty)
	elseif getmob(destx,desty) then
		hitmob(player,getmob(destx,desty))
	else
		if inbounds(player.x+dx,player.y+dy) then
			player.x+=dx
			player.y+=dy
		end

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