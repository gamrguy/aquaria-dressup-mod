
local xlat = {
    naija2 = "Naija",
    energyform = "Energy",
    veggie = "Nature",
    cc = "Crab",
    etc = "Krotite",
    mithalas_girl1 = "Mithalan 1",
    mithalas_girl2 = "Mithalan 2",
    mithalan = "Princess",
}

v.set = ""
v.text = 0

function init(me)
	--v.set = node_getName(me):splitws()[2]
    v.set = node_getContent(me) -- easier
	v.text = createBitmapText(xlat[v.set] or v.set, 1500, 0, 0)
end

function update(me, dt)
	if(not STOPPED) then
		node_setCursorActivation(me, true)
	end
	
    local x, y = getMouseWorldPos()
	if(node_isPositionIn(me, x, y)) then
		text_setPosition(v.text, x, y)
		text_alpha(v.text, 1)
	else
		text_alpha(v.text, 0)
	end
end

function activate(me)
	local manager = getNode("clothesmanager")
	node_msg(manager, v.set)
end