-- json parser
-- from: https://gist.github.com/tylerneylon/59f4bcf316be525b30ab
_tok={
 ['true']=true,
 ['false']=false}
_g={}

table_delims={['{']="}",['[']="]"}

function match(s,tokens)
  for i=1,#tokens do
		if(s==sub(tokens,i,i)) return true
  end
  return false
end

function skip_delim(wrkstr, pos, delim, err_if_missing)
 if sub(wrkstr,pos,pos)!=delim then
  return pos,false
 end
 return pos+1,true
end

function parse_str_val(wrkstr, pos, val)
  val=val or ''
  local c=sub(wrkstr,pos,pos)
  if(c=='"') return _g[val] or val,pos+1
  return parse_str_val(wrkstr,pos+1,val..c)
end

function parse_num_val(wrkstr,pos,val)
  val=val or ''
  local c=sub(wrkstr,pos,pos)
  if(not match(c,"-xb0123456789abcdef.")) return tonum(val),pos
  return parse_num_val(wrkstr,pos+1,val..c)
end

function json_parse(wrkstr, pos, end_delim)
 pos=pos or 1

 local first=sub(wrkstr,pos,pos)
 if match(first,"{[") then
		local obj,key,delim_found={},true,true
		pos+=1
		while true do
	 		key,pos=json_parse(wrkstr, pos, table_delims[first])
	 		if(key==nil) return obj,pos
	 		if first=="{" then
				pos=skip_delim(wrkstr,pos,':',true)  -- true -> error if missing.
				obj[key],pos=json_parse(wrkstr,pos)
		 	else
				add(obj,key)
	 		end
	 		pos,delim_found=skip_delim(wrkstr, pos, ',')
		end
	elseif first=='"' then
		return parse_str_val(wrkstr,pos+1)
	elseif match(first,"-0123456789") then
		return parse_num_val(wrkstr, pos)
	elseif first==end_delim then  -- end of an object or array.
		return nil,pos+1
	else
		for lit_str,lit_val in pairs(_tok) do
			local lit_end=pos+#lit_str-1
			if sub(wrkstr,pos,lit_end)==lit_str then return lit_val,lit_end+1 end
		end
	end
end