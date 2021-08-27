function draw_start()
	debug={}

	cls()
	spr(64,24,24,10,3)
	print("christopher gibilisco", 23, 114, 5)
	print("press ❎",48,90,6+min(sin(time())),1)

	for rad in all(rads) do
 	    pset(rad.x,rad.y,rad.c)
	end
end
