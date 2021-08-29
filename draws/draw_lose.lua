function draw_lose()
	cls()
	spr(3,60,52)
	print("you died",46,100)
	print("press ❎",46,114,6+min(sin(time())),1)
end