v.mbDown = false

function init(me)
end

function update(me)
	local click = isLeftMouse() or isRightMouse()
    if click and not v.mbDown then
        v.mbDown = true
    elseif not click and v.mbDown then
        v.mbDown = false
        local act = getNodeToActivate()
        setNodeToActivate(0)
        if act ~= 0 then
            node_activate(act)
        end
    end
end
