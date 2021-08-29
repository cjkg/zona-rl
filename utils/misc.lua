function getframe(ani)
	return ani[flr(t/8)%#ani+1]
end

function oprint8(_t,_x,_y,_c,_c2)
	for i=1,8 do
	  print(_t,_x+dirx[i],_y+diry[i],_c2)
	end
	print(_t,_x,_y,_c)
end

function isin(mem,set)
	for m in all(set) do
		if m==mem then
			return true
		end
	end
	return false
end

function rectfill2(_x,_y,_w,_h,_c)
	rectfill(_x,_y,_x+max(_w-1,0),_y+max(_h-1,0),_c)
end