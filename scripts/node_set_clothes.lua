
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
	local set = v.set
	
	local c = 1
	while(COSTUMES[c] ~= set) do
		c = c + 1
	end
	
	if(COSTUMES[set].head) then
		HEAD = c
	else
		HEAD = 1
	end
	BODY = c
	ARMS = c
	LEGS = c
	
	bone_setTexture(BODY_BONE, PATH..set.."-body")
	
	local costume = COSTUMES[set]
	
	if(costume.arms) then
		c = 1
		while(COSTUMES[c] ~= costume.arms) do
			c = c + 1
		end
		ARMS = c
		SET_ARMS(costume.arms)
	else
		SET_ARMS(set)
	end
	
	if(costume.legs) then
		c = 1
		while(COSTUMES[c] ~= costume.legs) do
			c = c + 1
		end
		LEGS = c
		SET_LEGS(costume.legs)
	else
		SET_LEGS(set)
	end
end