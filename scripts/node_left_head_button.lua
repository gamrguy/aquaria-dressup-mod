--[[
This is a button for switching Naija's head.
It utilizes the HEAD global variable 
initiated in node_setup.
]]--

function init(me)
end

function update(me, dt)
	node_setCursorActivation(me, true)
end

function activate(me)
	repeat
		HEAD = HEAD - 1
		if(HEAD < 1) then
			HEAD = #COSTUMES
		end
	until(COSTUMES[COSTUMES[HEAD]].head) 
end