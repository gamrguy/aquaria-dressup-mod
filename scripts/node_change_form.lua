function init(me)
	--[[
	v.forms = {}
	v.forms["normal"] = FORM_NORMAL
	v.forms["energy"] = FORM_ENERGY
	v.forms["beast"] = FORM_BEAST
	v.forms["sun"] = FORM_SUN
	v.forms["nature"] = FORM_NATURE
	]]
end

function update(me)
	node_setCursorActivation(me, true)
end

function activate(me)
	--DEPRECATED: replaced with skin xml swaps
	--[[
	local form = getForm()
	if(form == FORM_SUN) then
		changeForm(FORM_NORMAL)
	elseif(form+1 ~= FORM_SPIRIT) then
		changeForm(form+1)
	else
		changeForm(FORM_SUN)
	end
	]]
	local manager = getNode("clothesmanager")
	node_msg(manager, "skin")
end