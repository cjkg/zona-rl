function gethazard(x,y)
	for h in all(hazards) do
    	if h.x==x and h.y==y then
    		return h
	 	end
	end
	return false
end