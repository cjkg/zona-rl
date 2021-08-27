function addfloat(_txt,_x,_y,_c)
	_x=mid(0,_x-(#_txt*4)/2+5,128-(#_txt*4+4))
	add(float,{txt=_txt,x=_x,y=_y,c=_c,targety=_y-10,timer=40})
end

function dofloats()
	for f in all(float) do
		f.y+=(f.targety-f.y)/10
		f.timer+=1
		if f.timer>70 then
			del(float,f)
		end
	end
end