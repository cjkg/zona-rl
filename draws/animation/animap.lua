function animap()
	tani+=1
	if (tani<30) return
	tani=0
	for x=0,15 do
		for y=0,15 do
			local tle=mget(x,y)
			if isin(tle,mapani.ani1) then
				tle+=1
			elseif isin(tle,mapani.ani2) then
				tle-=1
			end
		mset(x,y,tle)
		end
	end
end