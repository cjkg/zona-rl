function dobutton(button)
	if button<0 then return end
	if button<4 then
		moveplayer(dirx[button+1],diry[button+1])
	end
	-- menu button
end

function dobuttonbuff()
	if buttonbuff==-1 then
		buttonbuff=getbutton()
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