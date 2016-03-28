local body

function init(me)
	body = entity_getBoneByIdx(getNaija(), BODY_BONE)
end

function update(me, dt)
	node_setCursorActivation(me, true)
end

function activate(me)
	BODY = BODY + 1
	if(BODY > #COSTUMES) then
		BODY = 1
	end
	
	--no need for special checks when every costume has a body
	bone_setTexture(body, PATH..COSTUMES[BODY].."-body")
end