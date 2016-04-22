function init(me)
end

function update(me, dt)
	node_setCursorActivation(me, true)
end

function activate(me)
	local form = getForm()
	setCostume(node_getContent(me))
	changeForm(form)
end