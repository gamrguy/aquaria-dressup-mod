local set

function init(me, s)
	set = s
end

function update(me, dt)
	if(not STOPPED) then
		node_setCursorActivation(me, true)
	end
end

function activate(me)
	local c = 1
	while(not (COSTUMES[c] == set)) do
		c = c + 1
	end
	
	HEAD = c
	BODY = c
	ARMS = c
	LEGS = c
	
	setCostume(COSTUMES[c])
	setCostume(COSTUMES[c].."_body")
	setCostume(COSTUMES[c].."-arms")
	setCostume(COSTUMES[c].."-legs")
end