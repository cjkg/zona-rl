function update_start()
	if btnp(❎) then	
		_upd=update_game
		_drw=draw_game
		fadeout()
	end
	update_rads()
end

function update_rads()
    for rad in all(rads) do
        rad.x+=rad.s
        rad.y+=rnd(1)-.25
        if rad.x>=128 then
            rad.x=0
            rad.y=rnd(128)
            rad.c=flr(rnd(2))+10
        end
    end
end