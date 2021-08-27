function _init()
	t,tani,fadeperc=0,0,0
	_g=json_parse('{"objects":[{"name":"door","tiles":[58],"sfx":-1,"effect":48}],"mapani":{"ani1":[49,51],"ani2":[50,52]},"dpal":[0,1,1,2,1,13,6,4,4,9,3,13,1,13,14],"dirx":[-1,1,0,0,1,1,-1,-1],"diry":[0,0,-1,1,-1,1,1,-1],"p_ani":[1,1,2,2]}')

	--★
	debug={}

	dtb_init()
	start_game()
end

function _update60()
	t+=1
	dtb_update()
	
	dofloats()
	
	_upd()
end

function _draw()
	_drw()
	checkfade()

	--★
	cursor(4,4)
	color(8)
	for txt in all(debug) do
		print(txt)
	end
end

function start_game()
	dirx,diry,mapani,dpal,p_ani,objects=_g.dirx,_g.diry,_g.mapani,_g.dpal,_g.p_ani,_g.objects
	_upd=update_start
	_drw=draw_start
	float={}
	p_x=1
	p_y=1
	
	rads={}
	for i=1,10 do
  		add(rads,{
   			x=rnd(128),
   			y=rnd(128),
   			s=rnd(1)+.25,
   			c=flr(rnd(2))+10
  })
 end
end