function doshake()
    local shakex,shakey=1-rnd(2),1-rnd(2)
   
    shakex*=shake
    shakey*=shake

    camera(shakex,shakey)
    
    shake*=0.75
    if (shake<0.05) shake=0
end