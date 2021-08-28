function bump(tile,destx,desty)
	for obj in all(mapobjects) do
		if isin(tile,obj.tiles) then
			sfx(obj.sfx)
			
			if obj.dialog then
				dtb_disp(obj.dialog)
			end
			
			if obj.trap then
				--obj.trap_effect
			end

			if obj._float then
				for _f in all(obj._float) do
					addfloat(_f.txt,
						destx*8,
						desty*8,
						_f.c)
				end
			end
								
			if obj.tile_effect then
				mset(destx,desty,obj.tile_effect)
			end		
			break
		end
	end
end