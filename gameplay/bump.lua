function bump(tile,destx,desty)
	for obj in all(objects) do
		add(debug,obj.name)
		if isin(tile,obj.tiles) then
			sfx(obj.sfx)
			
			if obj.dialog then
				dtb_disp(obj.dialog)
			end
			
			local _float=obj.float
			if _float then
				for _f in all(_float) do
					addfloat(_f.txt,
						destx*8,
						desty*8,
						_f.c)
				end
			end
								
			if obj.effect then
				mset(destx,desty,obj.effect)
			end		
			break
		end
	end
end