function draw_game()
	if fadeperc==1 then return end --fixes flicker
	
	animap()

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
	
	dtb_draw()
	
	

	drawhud()	



	for f in all(float) do	
		oprint8(f.txt,f.x,f.y,f.c,0)
	end
end