function init(me)
end

function update(me, dt)
	node_setCursorActivation(me, true)
end

function activate(me)
	repeat
		LEGS = LEGS + 1
		if(LEGS > #COSTUMES) then
			LEGS = 1
		end
	until(not COSTUMES[COSTUMES[LEGS]].legs)
	
	local costume = COSTUMES[COSTUMES[LEGS]]
	
	SET_LEGS(costume)
end