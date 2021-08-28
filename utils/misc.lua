function getframe(ani)
	return ani[flr(t/8)%#ani+1]
end

function _drawspr(_spr,_x,_y,_c,_flip)
	palt(0,false)
	pal(6,_c)
	spr(_spr,_x,_y,1,1,_flip)
	pal()
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

function copymap(x,y)
	local tle
	for _x=0,15 do
  	for _y=0,15 do
  		tle=mget(_x+x,_y+y)
   		mset(_x,_y,tle)
   		if tle==4 then
   			player.x,player.y=_x,_y
   		end
  	end
 	end
end
