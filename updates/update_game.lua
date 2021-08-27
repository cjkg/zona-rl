function update_game()
	for i=0,3 do
		if btn(i) and #dtb_queu==0 then
			moveplayer(dirx[i+1],diry[i+1])			
			return
		end
	end
end