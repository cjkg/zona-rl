function update_hazards()
    
    for b in all(entities) do
        
		local bx,by=b.x,b.y
        
        if b.hazards and b!= player then
            debug[4]=turn
            for h in all(b.hazards) do
                
                if b.atk_type=="cross" then
                    h.x=(bx+cross_cycle[turn%4+1].x)*8
                    h.y=(by+cross_cycle[turn%4+1].y)*8
                elseif b.atk_type=="spiral" then
                    h.x=bx*8+spiral_pos[turn%8+1].x*8
                    h.y=by*8+spiral_pos[turn%8+1].y*8
                elseif b.atk_type=="whip" then
                    h.x=bx*8
                    h.y=by*8+whip_pos[turn%6+1].y*8
                end
            end	
        end
    end
end 