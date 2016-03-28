local frontleg1, frontleg2, frontleg3
local backleg1, backleg2, backleg3

function init(me)
	local n = getNaija()
	frontleg1 = entity_getBoneByIdx(n, FRONTLEG1_BONE)
	frontleg2 = entity_getBoneByIdx(n, FRONTLEG2_BONE)
	frontleg3 = entity_getBoneByIdx(n, FRONTLEG3_BONE)
	
	backleg1 = entity_getBoneByIdx(n, BACKLEG1_BONE)
	backleg2 = entity_getBoneByIdx(n, BACKLEG2_BONE)
	backleg3 = entity_getBoneByIdx(n, BACKLEG3_BONE)
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
	
	if(costume.leg1) then
		bone_setTexture(frontleg1, PATH..COSTUMES[LEGS].."-leg1")
		bone_setTexture(backleg1, PATH..COSTUMES[LEGS].."-leg1")
	else
		if(costume.frontleg1) then
			bone_setTexture(frontleg1, PATH..COSTUMES[LEGS].."-frontleg1")
		else
			bone_setTexture(frontleg1, PATH.."naija2-frontleg1")
		end
		if(costume.backleg1) then
			bone_setTexture(backleg1, PATH..COSTUMES[LEGS].."-backleg1")
		else
			bone_setTexture(backleg1, PATH.."naija2-backleg1")
		end
	end
	
	if(costume.leg2) then
		bone_setTexture(frontleg2, PATH..COSTUMES[LEGS].."-leg2")
		bone_setTexture(backleg2, PATH..COSTUMES[LEGS].."-leg2")
	else
		if(costume.frontleg2) then
			bone_setTexture(frontleg2, PATH..COSTUMES[LEGS].."-frontleg2")
		else
			bone_setTexture(frontleg2, PATH.."end-frontleg2")
		end
		if(costume.backleg2) then
			bone_setTexture(backleg2, PATH..COSTUMES[LEGS].."-backleg2")
		else
			bone_setTexture(backleg2, PATH.."end-backleg2")
		end
	end
	
	if(costume.leg3) then
		bone_setTexture(frontleg3, PATH..COSTUMES[LEGS].."-leg3")
		bone_setTexture(backleg3, PATH..COSTUMES[LEGS].."-leg3")
	else
		if(costume.frontleg3) then
			bone_setTexture(frontleg3, PATH..COSTUMES[LEGS].."-frontleg3")
		else
			bone_setTexture(frontleg3, PATH.."naija2-frontleg3")
		end
		if(costume.backleg3) then
			bone_setTexture(backleg3, PATH..COSTUMES[LEGS].."-backleg3")
		else
			bone_setTexture(backleg3, PATH.."naija2-backleg3")
		end
	end
end