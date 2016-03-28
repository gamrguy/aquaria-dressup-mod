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
		ARMS = ARMS - 1
		if(ARMS < 1) then
			ARMS = #COSTUMES
		end
	until(not COSTUMES[COSTUMES[ARMS]].arms)
	
	local costume = COSTUMES[COSTUMES[ARMS]]
	
	if(costume.frontarm1) then
		bone_setTexture(frontarm1, PATH..COSTUMES[ARMS].."-frontarm1")
	else
		bone_setTexture(frontarm1, PATH.."naija2-frontarm1")
	end
	if(costume.frontarm2) then
		bone_setTexture(frontarm2, PATH..COSTUMES[ARMS].."-frontarm2")
	else
		bone_setTexture(frontarm2, PATH.."end-frontarm2")
	end
	if(costume.frontarm3) then
		bone_setTexture(frontarm3, PATH..COSTUMES[ARMS].."-frontarm3")
	else
		bone_setTexture(frontarm3, PATH.."naija2-frontarm3")
	end
	
	if(costume.backarm1) then
		bone_setTexture(backarm1, PATH..COSTUMES[ARMS].."-backarm1")
	else
		bone_setTexture(backarm1, PATH.."naija2-backarm1")
	end
	if(costume.backarm2) then
		bone_setTexture(backarm2, PATH..COSTUMES[ARMS].."-backarm2")
	else
		bone_setTexture(backarm2, PATH.."end-backarm2")
	end
	if(costume.backarm3) then
		bone_setTexture(backarm3, PATH..COSTUMES[ARMS].."-backarm3")
	else
		bone_setTexture(backarm3, PATH.."naija2-backarm3")
	end
end