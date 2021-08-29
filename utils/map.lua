function dist(fx,fy,tx,ty)
	return sqrt((fx-tx)^2+(fy-ty)^2)
end

function iswalkable2(x,y,mode)
	local mode=mode or ""
 	if inbounds(x,y) then
  		local tle=mget(x,y)
  		if mode=="sight" then
			return not fget(tle,2)
  		else
	 		if not fget(tle,0) then
	   			if mode=="checkmobs" then
	    			return not getmob(x,y)
	   			end
	   			return true
	  		end
		end
 	end
 	return false
end
function iswalkable(x,y,mode)
	local mode = mode or "test"
	if inbounds(x,y) then
	 	local tle=mget(x,y)
	 	if mode=="sight" then
	  		return not fget(tle,2)
	 	else
	  		if not fget(tle,0) then
	   			if mode=="checkmobs" then
					return not getmob(x,y)
	   			end
	   			return true
	  		end
	 	end
	end
	return false
end

function copymap(x,y)
	local tle
	for _x=0,15 do
		for _y=0,15 do
			tle=mget(_x+x,_y+y)
			mset(_x,_y,tle)
			if tle==4 then
				player.x,player.y=_x,_y
			end
		end
 	end
end

function getmob(x,y)
	for e in all(entities) do
		if e.x==x and e.y==y then
	  		return e
	 	end
	end
	return false
end

function inbounds(x,y)
	return x>=0 and y>=0 and x<16 and y<16
end

function los(x1,y1,x2,y2)
	local frst,sx,sy,dx,dy=true
	if dist(x1,y1,x2,y2)<=1.42 then return true end
	
	if x1<x2 then
		sx,dx=1,x2-x1
	else
	 	sx,dx=-1,x1-x2
	end
	if y1<y2 then
	 	sy,dy=1,y2-y1
	else
	 	sy,dy=-1,y1-y2
	end
	
	local err,e2=dx-dy
	while not(x1==x2 and y1==y2) do
		if not frst and not iswalkable(x1,y1,"sight") then return false end
		frst,e2=false,err*2
		if e2>-dy then
			err-=dy
			x1+=sx
		end
		if e2<dx then
			err+=dx
			y1+=sy
		end
	end
	return true
end

function blankmap(_dflt)
	local ret={}
	if (_dflt==nil) _dflt=0
	for x=0,15 do
		ret[x]={}
	 	for y=0,15 do
	  		ret[x][y]=_dflt
	 	end
	end
	return ret
end

function unfog()
	local px,py=player.x,player.y
	for x=0,15 do
 		for y=0,15 do
  			if fog[x][y]==1 
  			and dist(px,py,x,y)<=player.los 
			and los(px,py,x,y) then
				unfogtile(x,y)
   			end
  		end
 	end
end

function unfogtile(x,y)
	fog[x][y]=0
 	if iswalkable(x,y,"sight") then
  		for i=1,4 do
   			local tx,ty=x+dirx[i],y+diry[i]
   			if inbounds(tx,ty) and not iswalkable(tx,ty,"sight") then
				fog[tx][ty]=0
   			end
  		end
 	end
end

function refog()
	local px,py=player.x,player.y
	for x=0,15 do
 		for y=0,15 do
  			if fog[x][y]==0 
  			and not (dist(px,py,x,y)<=player.los and
			los(px,py,x,y)) then	
				refogtile(x,y)
			elseif fog[x][y]==0 and los(px,py,x,y) then
				if mget(x,y)==63 then
					mset(x,y,48)
				end
   			end
  		end
 	end
end

function refogtile(x,y)
	if mget(x,y)==48 then
		mset(x,y,63)
	end
end

function calcdist(tx,ty)
	local cand,step,candnew={},0
	distmap=blankmap(-1)
	add(cand,{x=tx,y=ty})
	distmap[tx][ty]=0
	repeat
		step+=1
	 	candnew={}
	 	for c in all(cand) do
	  		for d=1,4 do
		   		local dx,dy=c.x+dirx[d],c.y+diry[d]
		   		if inbounds(dx,dy) and distmap[dx][dy]==-1 then
					distmap[dx][dy]=step
					if iswalkable(dx,dy) then
				 		add(candnew,{x=dx,y=dy})
					end
		   		end
	  		end
	 	end
		cand=candnew
	until #cand==0
end