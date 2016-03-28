function init(me)
end

function update(me)
	if(not STOPPED) then
		node_setCursorActivation(me, true)
	end
end

function activate(me)
	node_msg(getNode("setup"), "stop")
end