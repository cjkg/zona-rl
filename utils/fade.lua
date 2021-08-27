function dofade()
local p,kmax,col,k=flr(mid(0,fadeperc,1)*100)
 for j=1,15 do
  col = j
  kmax=flr((p+j*1.46)/22)
  for k=1,kmax do
   col=dpal[col]
  end
  pal(j,col,1)
 end
end

function checkfade()
 if fadeperc>0 then
  fadeperc=max(fadeperc-0.04,0)
  dofade()
 end
end

function wait(_wait)
 repeat
  _wait-=1
  flip()--?
 until _wait<0
end

function fadeout(spd,_wait)
	if (spd==nil) spd=0.04
 	if (_wait==nil) _wait=0
 	repeat
  	fadeperc=min(fadeperc+spd,1)
  	dofade()
 		flip()
 	until fadeperc==1
 	wait(_wait)
end