local on = false

function init(me)
	node_setCursorActivation(me, true)
end

function update(me, dt)
	if(on) then
		entity_setState(getNaija(), 1234)
		if(entity_getAnimationName(getNaija()) ~= "swim") then
			entity_animate(getNaija(), "swim", -1)
		end
	end
end

function activate(me)
	if(not on) then
		on = true
	else
		entity_idle(getNaija())
		entity_setRiding(getNaija(), getNaija())
		on = false
	end
end