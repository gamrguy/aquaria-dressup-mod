dofile("scripts/stuff.lua")

local v = {}
v.head = 1
v.body = 1
v.arms = 1
v.legs = 1

local function prevClothes(type)
	local var = v[type]
	repeat
		var = var - 1
		if(var < 1) then
			var = #COSTUMES
		end
	until(not COSTUMES[COSTUMES[var]][type])
	v[type] = var
end
local function nextClothes(type)
	local var = v[type]
	repeat
		var = var + 1
		if(var > #COSTUMES) then
			var = 1
		end
	until(not COSTUMES[COSTUMES[var]][type])
	v[type] = var
end

local function find_set(set)
	local c = 1
	while(COSTUMES[c] ~= set) do
		c = c + 1
		if c > #COSTUMES then
			return -1
		end
	end
	return c
end

local function switchToSet(type, set)
	if set ~= nil then
		--Handling for use of other costume's parts
		if COSTUMES[set][type] then
			v[type] = find_set(COSTUMES[set][type])
		else
			v[type] = find_set(set)
		end
	end
end
local function set_legs(set)
	switchToSet("legs", set)
	
	local newLegs = v.legs
	local cosName = COSTUMES[newLegs]
	local costume = COSTUMES[cosName]
	
	if(costume.leg1) then
		bone_setTexture(v.FRONTLEG1, PATH..cosName.."-leg1-armor")
		bone_setTexture(v.BACKLEG1, PATH..cosName.."-leg1-armor")
	else
		if(costume.frontleg1) then
			bone_setTexture(v.FRONTLEG1, PATH..cosName.."-frontleg1-armor")
		else
			bone_setTexture(v.FRONTLEG1, "transparent")
		end
		if(costume.backleg1) then
			bone_setTexture(v.BACKLEG1, PATH..cosName.."-backleg1-armor")
		else
			bone_setTexture(v.BACKLEG1, "transparent")
		end
	end
	
	if(costume.leg2) then
		bone_setTexture(v.FRONTLEG2, PATH..cosName.."-leg2-armor")
		bone_setTexture(v.BACKLEG2, PATH..cosName.."-leg2-armor")
	else
		if(costume.frontleg2) then
			bone_setTexture(v.FRONTLEG2, PATH..cosName.."-frontleg2-armor")
		else
			bone_setTexture(v.FRONTLEG2, "transparent")
		end
		if(costume.backleg2) then
			bone_setTexture(v.BACKLEG2, PATH..cosName.."-backleg2-armor")
		else
			bone_setTexture(v.BACKLEG2, "transparent")
		end
	end
	
	if(costume.leg3) then
		bone_setTexture(v.FRONTLEG3, PATH..cosName.."-leg3-armor")
		bone_setTexture(v.BACKLEG3, PATH..cosName.."-leg3-armor")
	else
		if(costume.frontleg3) then
			bone_setTexture(v.FRONTLEG3, PATH..cosName.."-frontleg3-armor")
		else
			bone_setTexture(v.FRONTLEG3, "transparent")
		end
		if(costume.backleg3) then
			bone_setTexture(v.BACKLEG3, PATH..cosName.."-backleg3-armor")
		else
			bone_setTexture(v.BACKLEG3, "transparent")
		end
	end
end
local function set_arms(set)
	switchToSet("arms", set)
	
	local newArms = v.arms
	local cosName = COSTUMES[v.arms]
	local costume = COSTUMES[cosName]
	
	if(costume.frontarm1) then
		bone_setTexture(v.FRONTARM1, PATH..cosName.."-frontarm1-armor")
	else
		bone_setTexture(v.FRONTARM1, "transparent")
	end
	if(costume.frontarm2) then
		bone_setTexture(v.FRONTARM2, PATH..cosName.."-frontarm2-armor")
	else
		bone_setTexture(v.FRONTARM2, "transparent")
	end
	if(costume.frontarm3) then
		bone_setTexture(v.FRONTARM3, PATH..cosName.."-frontarm3-armor")
	else
		bone_setTexture(v.FRONTARM3, "transparent")
	end
	
	if(costume.backarm1) then
		bone_setTexture(v.BACKARM1, PATH..cosName.."-backarm1-armor")
	else
		bone_setTexture(v.BACKARM1, "transparent")
	end
	if(costume.backarm2) then
		bone_setTexture(v.BACKARM2, PATH..cosName.."-backarm2-armor")
	else
		bone_setTexture(v.BACKARM2, "transparent")
	end
	if(costume.backarm3) then
		bone_setTexture(v.BACKARM3, PATH..cosName.."-backarm3-armor")
	else
		bone_setTexture(v.BACKARM3, "transparent")
	end
end
local function set_helmet(set)
	switchToSet("head", set)
	if(COSTUMES[COSTUMES[v.head]].usesDefaultHair) then
		bone_setTexture(v.HAIR_BONE, PATH..COSTUMES["default_hair"][getForm()+1].."-helmet")
	else
		bone_setTexture(v.HAIR_BONE, "transparent")
	end
	
	if COSTUMES[COSTUMES[v.head]].bald then
		bone_setTexture(v.HEAD_BONE, "transparent")
	else
		bone_setTexture(v.HEAD_BONE, PATH..COSTUMES[v.head].."-helmet")
	end
	
	if (getForm() == FORM_BEAST and COSTUMES[COSTUMES[v.head]].usesDefaultHair) or COSTUMES[COSTUMES[v.head]].noEars then
		bone_setTexture(v.EARS_BONE, "transparent")
	else
		bone_setTexture(v.EARS_BONE, PATH..COSTUMES["ears"][getForm()+1].."-ears")
	end
end
local function set_body(set)
	switchToSet("body", set)
	bone_setTexture(v.BONE_ARMOR, PATH..COSTUMES[v.body].."-overbody")
end

local function updateclothes(set)
	set_helmet(set)
	set_body(set)
	set_arms(set)
	set_legs(set)
	
	local setup = getNode("setup")
	node_msg(setup, "cape", v.body)
end

function init(me)
end

function update(me, dt)
    local n = getNaija()
    v.BODY_BONE = entity_getBoneByIdx(n, 0)
	v.HEAD_BONE = entity_getBoneByIdx(n, 34)
	v.HAIR_BONE = entity_getBoneByIdx(n, 38)
	v.EARS_BONE = entity_getBoneByIdx(n, 39)
	v.BONE_ARMOR = entity_getBoneByIdx(n, 24)

    v.FRONTARM1 = entity_getBoneByIdx(n, 35)
    v.FRONTARM2 = entity_getBoneByIdx(n, 36)
    v.FRONTARM3 = entity_getBoneByIdx(n, 37)

    v.BACKARM1 = entity_getBoneByIdx(n, 25)
    v.BACKARM2 = entity_getBoneByIdx(n, 26)
    v.BACKARM3 = entity_getBoneByIdx(n, 27)

    v.FRONTLEG1 = entity_getBoneByIdx(n, 31)
    v.FRONTLEG2 = entity_getBoneByIdx(n, 32)
    v.FRONTLEG3 = entity_getBoneByIdx(n, 33)

    v.BACKLEG1 = entity_getBoneByIdx(n, 28)
    v.BACKLEG2 = entity_getBoneByIdx(n, 29)
    v.BACKLEG3 = entity_getBoneByIdx(n, 30)
end

function msg(me, msg, msg2)
	local parts = {head=true, body=true, arms=true, legs=true}
	if parts[msg2] then
		if msg == "next" then
			nextClothes(msg2)
		elseif msg == "prev" then
			prevClothes(msg2)
		end
	end
	
	if COSTUMES[msg] then
		updateclothes(msg)
	else
		updateclothes()
	end
end