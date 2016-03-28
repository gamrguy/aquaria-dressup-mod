local anim

function init(me, a)
	anim = a
end

function update(me, dt)
	if(not STOPPED) then
		node_setCursorActivation(me, true)
	end
end

function activate(me)
	entity_animate(getNaija(), "swim", -1)
end