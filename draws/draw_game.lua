function draw_game()
	if fadeperc==1 then return end --fixes flicker

	animap()

	cls()
	map()
	
	_drawspr(getframe(p_ani),p_x*8,p_y*8,10,p_flip)
	dtb_draw()
	
	for f in all(float) do
		oprint8(f.txt,f.x,f.y,f.c,0)
	end
end