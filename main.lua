function _init()
	t,fadeperc,_g=0,0,json_parse('{"mobobjects":{"candycorn":{"hp":5,"maxhp":5,"ani":[10,10,11,11],"atk":1,"los":3},"player":{"hp":10,"maxhp":10,"ani":[1,1,2,2],"atk":1,"los":5}},"mapobjects":[{"name":"door","tiles":[52],"sfx":1,"tile_effect":48}],"hazard_types":{"cross":[{"name":"burner","sprt":12,"hp":-1}],"spiral":[{"name":"burner","sprt":12,"hp":-1},{"name":"burner","sprt":12,"hp":-1},{"name":"burner","sprt":12,"hp":-1},{"name":"burner","sprt":12,"hp":-1}],"whip":[{"name":"burner","sprt":12,"hp":-1},{"name":"burner","sprt":12,"hp":-1},{"name":"burner","sprt":12,"hp":-1}]},"mapani":{"ani1":[],"ani2":[]},"hazard_pos":{"cross_pos":[{"x":2,"y":0},{"x":0,"y":2},{"x":-2,"y":0},{"x":0,"y":-2}],"spiral_pos":[{"x":2,"y":2},{"x":2,"y":-2},{"x":-2,"y":-2},{"x":-2,"y":2},{"x":1,"y":1},{"x":1,"y":-1},{"x":-1,"y":-1},{"x":-1,"y":1}],"whip_pos":[{"x":0,"y":1},{"x":0,"y":2},{"x":0,"y":3},{"x":0,"y":-1},{"x":0,"y":-2},{"x":0,"y":-3}]},"dpal":[0,1,1,2,1,13,6,4,4,9,3,13,1,13,14],"dirx":[-1,1,0,0,1,1,-1,-1],"diry":[0,0,-1,1,-1,1,1,-1],"p_ani":[1,1,2,2],"p_shoot_ani":[4,4,5,5]}')

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
	cursor(4,4)
	color(8)
	for txt in all(debug) do
		print(txt)
	end
end

function startgame()
	--review these to see if the dot call would just be cheaper. I think there need to be 4 of each to make it
	turn,dirx,diry,dpal,p_ani,p_shoot_ani,mapobjects,mobobjects,fog=1,_g.dirx,_g.diry,_g.dpal,_g.p_ani,_g.p_shoot_ani,_g.mapobjects,_g.mobobjects,blankmap(1)
	inv,ammo,slots,maxslots,rubles,shake={},99,3,6,1000,0

	_upd=update_start
	_drw=draw_start
	float,entities,rads,throw_dir,throw_dx,throw_dy={},{},{},1,2,2
	player=addmob("player",1,2)
	
	--delete/review
	unfog()
	addmob("candycorn",8,8)
	addmob("candycorn",13,13)
	for i=1,10 do
  		add(rads,{
   			x=rnd(128),
   			y=rnd(128),
   			s=rnd(1)+.25,
   			c=flr(rnd(2))+10
 		})
 	end
end