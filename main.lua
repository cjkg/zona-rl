function _init()
	t,tani,fadeperc=0,0,0
	_g=json_parse('{"mobobjects":{"candycorn":{"hp":5,"maxhp":5,"ani":[10,10,11,11],"atk":1,"los":0},"player":{"hp":10,"maxhp":10,"ani":[1,1,2,2],"atk":1,"los":100}},"mapobjects":[{"name":"door","tiles":[52],"sfx":1,"tile_effect":48}],"hazards":{"cross_hazard":{"name":"burner","sprt":12,"hp":-1},"spiral_hazard":[{"name":"burner","sprt":12,"hp":-1},{"name":"burner","sprt":12,"hp":-1},{"name":"burner","sprt":12,"hp":-1},{"name":"burner","sprt":12,"hp":-1}],"whip_hazard":[{"name":"burner","sprt":12,"hp":-1},{"name":"burner","sprt":12,"hp":-1},{"name":"burner","sprt":12,"hp":-1}]},"mapani":{"ani1":[],"ani2":[]},"dpal":[0,1,1,2,1,13,6,4,4,9,3,13,1,13,14],"dirx":[-1,1,0,0,1,1,-1,-1],"diry":[0,0,-1,1,-1,1,1,-1],"p_ani":[1,1,2,2],"p_shoot_ani":[4,4,5,5]}')
	cross_cycle={{x=3,y=0},{x=0,y=3},{x=-3,y=0},{x=0,y=-3}}
	spiral_pos={{x=2,y=2},{x=2,y=-2},{x=-2,y=-2},{x=-2,y=2},{x=1,y=1},{x=1,y=-1},{x=-1,y=-1},{x=-1,y=1}}
	whip_pos={{x=0,y=1},{x=0,y=2},{x=0,y=3},{x=0,y=-1},{x=0,y=-2},{x=0,y=-3}}

	----delete/review
	cpumax,memmax,debug=0,0,{}

	dtb_init()
	startgame()
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

	----delete/review
	cursor(4,4)
	color(11)
	for txt in all(debug) do
		print(txt)
	end
end

function startgame()
	--review these to see if the dot call would just be cheaper. I think there need to be 4 of each to make it
	turn,dirx,diry,mapani,dpal,p_ani,p_shoot_ani,mapobjects,mobobjects,buttonbuff,fog=1,_g.dirx,_g.diry,_g.mapani,_g.dpal,_g.p_ani,_g.p_shoot_ani,_g.mapobjects,_g.mobobjects,-1,blankmap(0)
	inv={{
		x=5,
		y=8,
		name="gun",
		desc={"an old tokarev"},
		item=true,
		use_options={"equip","throw","trash"}
		},
		{
			x=5,
			y=8,
			name="red herb",
			desc={"a zone herb that", "heals 5 hp"},
			item=true,
			heal=5,
			effect="heal",
			use_options={"use","throw","trash"}
		}
	
	}
	p_t=0
	tt_ammo,slots,maxslots,rubles=99,3,6,1000
	whip_hazard=_g.hazards.whip_hazard
	throw_dir,throw_dx,throw_dy=1,2,2
	_upd=update_start
	_drw=draw_start
	float={}
	entities={}
	player=addmob("player",1,2)
	
	--delete/review
	unfog()
	rads={}
	candy=addmob("candycorn",8,8)
	for i=1,10 do
  		add(rads,{
   			x=rnd(128),
   			y=rnd(128),
   			s=rnd(1)+.25,
   			c=flr(rnd(2))+10
  })
 end
end