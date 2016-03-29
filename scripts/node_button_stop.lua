function init(me)
	node_setCursorActivation(me, true)
end

function update(me)
end

function activate(me)
	if(not STOPPED) then
		node_msg(getNode("setup"), "stop")
	else
		node_msg(getNode("setup"), "start")
	end
end