function _init()
	t,tani,fadeperc=0,0,0
	_g=json_parse('{"mobobjects":{"candycorn":{"hp":5,"maxhp":5,"ani":[10,10,11,11],"atk":1,"los":3},"player":{"hp":10,"maxhp":10,"ani":[1,1,2,2],"atk":1,"los":5}},"mapobjects":[{"name":"door","tiles":[52],"sfx":1,"tile_effect":48}],"mapani":{"ani1":[],"ani2":[]},"dpal":[0,1,1,2,1,13,6,4,4,9,3,13,1,13,14],"dirx":[-1,1,0,0,1,1,-1,-1],"diry":[0,0,-1,1,-1,1,1,-1],"p_ani":[1,1,2,2]}')

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
	color(7)
	for txt in all(debug) do
		print(txt)
	end
end

function startgame()
	dirx,diry,mapani,dpal,p_ani,mapobjects,mobobjects,buttonbuff,fog=_g.dirx,_g.diry,_g.mapani,_g.dpal,_g.p_ani,_g.mapobjects,_g.mobobjects,-1,blankmap(1)
	inv={{
		x=5,
		y=8,
		name="gun",
		item=true,
		use_options={"equip","throw","trash"}
		},
		{
			x=5,
			y=8,
			name="red herb",
			item=true,
			heal=5,
			effect="heal",
			use_options={"use","trash"}
		}
	
	}



	

	tt_ammo,slots,maxslots,rubles=16,3,6,0
	throw_dir,throw_dx,throw_dy=0,0,0
	_upd=update_start
	_drw=draw_start
	float={}
	entities={}
	player=addmob("player",1,2)
	addmob("candycorn",4,4)
	--delete/review
	unfog()
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