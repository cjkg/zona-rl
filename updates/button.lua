function dobutton(button)
	if button<0 then return end
	if button<4 then
		moveplayer(dirx[button+1],diry[button+1])
		poke(0x5f5d,10)
	elseif button==5 then
		_upd=update_shoot
		poke(0x5f5d,10)
	end
end

function getbutton()
	for i=0,5 do
		if btnp(i) then
			return i
		end
	end
	return -1
end