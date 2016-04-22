function init(me)
end

function update(me, dt)
	node_setCursorActivation(me, true)
end

function activate(me)
	local manager = getNode("clothesmanager")
	node_msg(manager, "prev", "legs")
end