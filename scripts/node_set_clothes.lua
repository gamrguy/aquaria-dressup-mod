if v == nil then v = {} end

function init(me)
	local t={} ; local i=1
	for str in string.gmatch(node_getName(me), "([^".." ".."]+)") do
		t[i] = str
		i = i + 1
	end
	
	v.set = t[2]
	
	if(v.set == "naija2") then
		v.text = createBitmapText("Naija", 1500, 0, 0)
	elseif(v.set == "energyform") then
		v.text = createBitmapText("Energy", 1500, 0, 0)
	elseif(v.set == "veggie") then
		v.text = createBitmapText("Nature", 1500, 0, 0)
	elseif(v.set == "cc") then
		v.text = createBitmapText("Crab", 1500, 0, 0)
	elseif(v.set == "etc") then
		v.text = createBitmapText("Krotite", 1500, 0, 0)
	elseif(v.set == "mithalas_girl1") then
		v.text = createBitmapText("Mithalan 1", 1500, 0, 0)
	elseif(v.set == "mithalas_girl2") then
		v.text = createBitmapText("Mithalan 2", 1500, 0, 0)
	elseif(v.set == "mithalan") then
		v.text = createBitmapText("Princess", 1500, 0, 0)
	else
		v.text = createBitmapText(v.set, 1500, 0, 0)
	end
end

function update(me, dt)
	if(not STOPPED) then
		node_setCursorActivation(me, true)
	end
	
	if(node_isPositionIn(me, getMouseWorldPos())) then
		text_setPosition(v.text, getMouseWorldPos())
	else
		text_setPosition(v.text, 0, 0)
	end
end

function activate(me)
	local t={} ; local i=1
	for str in string.gmatch(node_getName(me), "([^".." ".."]+)") do
		t[i] = str
		i = i + 1
	end
	local set = t[2]
	
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