--below is the dtb, 
--credit to oli414!

-- call this before you start using dtb.
-- optional parameter is the number of lines that are displayed. default is 3.
function dtb_init(numlines)
    dtb_queu,dtb_queuf,dtb_numlines={},{},3
    if numlines then
        dtb_numlines=numlines
    end
    _dtb_clean()
end

-- this will add a piece of text to the queu. the queu is processed automatically.
function dtb_disp(txt,callback)
    local lines,currline,curword,curchar={},"","",""
    local upt=function()
        if #curword+#currline>29 then
            add(lines,currline)
            currline=""
        end
        currline=currline..curword
        curword=""
    end
    for i=1,#txt do
        curchar=sub(txt,i,i)
        curword=curword..curchar
        if curchar==" " then
            upt()
        elseif #curword>28 then
            curword=curword.."-"
            upt()
        end
    end
    upt()
    if currline~="" then
        add(lines,currline)
    end
    add(dtb_queu,lines)
    if callback==nil then
        callback=0
    end
    add(dtb_queuf,callback)
end

-- functions with an underscore prefix are ment for internal use, don't worry about them.
function _dtb_clean()
    dtb_dislines={}
    for i=1,dtb_numlines do
        add(dtb_dislines,"")
    end
    --delete/review combine 
    dtb_curline=0
    dtb_ltime=0
end

function _dtb_nextline()
    dtb_curline+=1
    for i=1,#dtb_dislines-1 do
        dtb_dislines[i]=dtb_dislines[i+1]
    end
    dtb_dislines[#dtb_dislines]=""
end

function _dtb_nexttext()
    if dtb_queuf[1]~=0 then
        dtb_queuf[1]()
    end
    del(dtb_queuf,dtb_queuf[1])
    del(dtb_queu,dtb_queu[1])
    _dtb_clean()
end

-- make sure that this function is called each update.
function dtb_update()
    if #dtb_queu>0 then
        if dtb_curline==0 then
            dtb_curline=1
        end
        local dislineslength,curlines=#dtb_dislines,dtb_queu[1]
        local curlinelength=#dtb_dislines[dislineslength]
        local complete=curlinelength>=#curlines[dtb_curline]
        if complete and dtb_curline>=#curlines then
            if btnp(5) then
                _dtb_nexttext()
                return
            end
        elseif dtb_curline>0 then
            dtb_ltime-=1
            if not complete then
                if dtb_ltime<=0 then
                    local curchari=curlinelength+1
                    local curchar=sub(curlines[dtb_curline],curchari,curchari)
                    dtb_ltime=1
                    if curchar~=" " then
                        sfx(0)
                    end
                    if curchar=="." then
                        dtb_ltime=6
                    end
                    dtb_dislines[dislineslength]=dtb_dislines[dislineslength]..curchar
                end
                if btnp(5) then
                    dtb_dislines[dislineslength]=curlines[dtb_curline]
                end
            else
                if btnp(5) then
                    _dtb_nextline()
                end
            end
        end
    end
end

-- make sure to call this function everytime you draw.
function dtb_draw()
    if #dtb_queu>0 then
        local dislineslength,offset=#dtb_dislines,0
        if dtb_curline<dislineslength then
            offset=dislineslength-dtb_curline
        end
        rectfill(2,125-dislineslength*8,125,125,0)
        if dtb_curline>0 and #dtb_dislines[#dtb_dislines]==#dtb_queu[1][dtb_curline] then
            print("???",118,120+min(sin(time())),7)
        end
        for i=1,dislineslength do
            print(dtb_dislines[i],4,i*8+119-(dislineslength+offset)*8,7)
        end
    end
end