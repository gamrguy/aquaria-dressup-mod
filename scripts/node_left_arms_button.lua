function init(me)
end

function update(me, dt)
	node_setCursorActivation(me, true)
end

function activate(me)
	repeat
		ARMS = ARMS - 1
		if(ARMS < 1) then
			ARMS = #COSTUMES
		end
	until(not COSTUMES[COSTUMES[ARMS]].arms)
	
	SET_ARMS(COSTUMES[COSTUMES[ARMS]])
end