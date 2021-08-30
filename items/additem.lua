function takeitem(itm)
	local i=freeslot(inv)
	if (i==0) return false
	inv[i]=itm
	return true
end

function freeslot(set)
	for i=1,slots do
		if not set[i] then
			return i
		end
	end
	return 0
end