local frontarm1, frontarm2, frontarm3
local backarm1, backarm2, backarm3

function init(me)
	local n = getNaija()
	frontarm1 = entity_getBoneByIdx(n, FRONTARM1_BONE)
	frontarm2 = entity_getBoneByIdx(n, FRONTARM2_BONE)
	frontarm3 = entity_getBoneByIdx(n, FRONTARM3_BONE)
	
	backarm1 = entity_getBoneByIdx(n, BACKARM1_BONE)
	backarm2 = entity_getBoneByIdx(n, BACKARM2_BONE)
	backarm3 = entity_getBoneByIdx(n, BACKARM3_BONE)
end

function update(me, dt)
	node_setCursorActivation(me, true)
end

function activate(me)
	repeat
		ARMS = ARMS + 1
		if(ARMS > #COSTUMES) then
			ARMS = 1
		end
	until(not COSTUMES[COSTUMES[ARMS]].arms)
	
	SET_ARMS(COSTUMES[COSTUMES[ARMS]])
end