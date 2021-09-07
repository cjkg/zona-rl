function draw_game()
	if fadeperc==1 then return end --fixes flicker

	cls()
	map()

	for e in all(entities) do
		if cansee(player,e) then 
			spr(getframe(e.ani),e.x*8,e.y*8,1,1,e.flip)
		end
	end
	
	for x=0,15 do
		for y=0,15 do
			if fog[x][y]==1 then
				rectfill2(x*8,y*8,8,8,0)
			end
		end
	end

	--delete/review: put in own function
	if _upd==update_throw or _upd==update_shoot then
		local col=_upd==update_throw and 7 or 8
		if _upd==update_shoot then
			tx,ty=throwtile()
			if tx<player.x then
				player.flip=true
			else
				player.flip=false
			end
			if dist(player.x,player.y,tx,ty)<=player.los then
				pset(tx*8+3,ty*8+3,col)
			end
		end	
		
		--delete/review laser sight for gun
		palt(11,true)
		pal(7,col)
		spr(throw_dir+112,player.x*8+sin(t/30)*throw_dx+throw_dx*8,
			player.y*8+sin(t/30)*throw_dy+throw_dy*8,
			1,
			1)
		pal()
	end 

	dtb_draw()
	drawhud()	
	
	for f in all(float) do	
		oprint8(f.txt,f.x,f.y,f.c,0)
	end

	doshake()
end