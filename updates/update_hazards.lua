function update_hazards()
    hazards={}
    for b in all(entities) do
		local bx,by=b.x,b.y
        if b.hazards then
            for h in all(b.hazards) do
                if b.atk_type=="cross" then
                    h.x=(bx+cross_cycle[turn%4+1].x)
                    h.y=(by+cross_cycle[turn%4+1].y)
                elseif b.atk_type=="spiral" then
                    h.x=bx+spiral_pos[turn%8+1].x
                    h.y=by+spiral_pos[turn%8+1].y
                elseif b.atk_type=="whip" then
                    h.x=bx
                    h.y=by+whip_pos[turn%6+1].y
                end
                add(hazards,h)
            end	
        end
    end
end 