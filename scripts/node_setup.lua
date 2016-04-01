--[[
This file sets all the important stuff needed by other nodes.

In this case, the lists of available clothing items and
what sets they belong in. And keeps track of current selected items.

Also keeps Naija with the correct clothing items.
]]--

dofile("scripts/stuff.lua")

function init(me)
    STOPPED = false
    local n = getNaija()
	entity_setRiding(n, n)
	entity_scale(n, 2, 2)
	avatar_toggleCape(false)
	--local bone = entity_getBoneByIdx(n, 0)
	--bone_setTexture(bone, "naija/dfn-body")
    
end

function update(me, dt)

    local n = getNaija()
    BODY_BONE = entity_getBoneByIdx(n, 0)

    FRONTARM1 = entity_getBoneByIdx(n, 2)
    FRONTARM2 = entity_getBoneByIdx(n, 3)
    FRONTARM3 = entity_getBoneByIdx(n, 11)

    BACKARM1 = entity_getBoneByIdx(n, 4)
    BACKARM2 = entity_getBoneByIdx(n, 5)
    BACKARM3 = entity_getBoneByIdx(n, 10)

    FRONTLEG1 = entity_getBoneByIdx(n, 8)
    FRONTLEG2 = entity_getBoneByIdx(n, 9)
    FRONTLEG3 = entity_getBoneByIdx(n, 13)

    BACKLEG1 = entity_getBoneByIdx(n, 6)
    BACKLEG2 = entity_getBoneByIdx(n, 7)
    BACKLEG3 = entity_getBoneByIdx(n, 12)

	--setCostume(COSTUMES[BODY].."_body")
	--setCostume(COSTUMES[ARMS].."-arms")
	--setCostume(COSTUMES[LEGS].."-legs")
	local isNaijaMatch = (COSTUMES[HEAD] == "naija2") and (getCostume() == "")
	if(getCostume() ~= COSTUMES[HEAD] and not isNaijaMatch) then
		if(COSTUMES[HEAD] == "naija2") then
			setCostume("")
		else
			setCostume(COSTUMES[HEAD])
		end
	end
	
	if(not STOPPED) then
		avatar_toggleCape(false)
	end
end

function msg(me, msg)
    local n = getNaija()
	if(msg == "stop") then
		STOPPED = true
		entity_setRiding(n, nil)
		entity_scale(n, 0.5, 0.5)
		
		for key, value in pairs(COSTUMES["capes"]) do
			if(COSTUMES[HEAD] == value) then
				avatar_toggleCape(true)
				break
			end
		end
	end
	
	if(msg == "start") then
		avatar_fallOffWall()
		entity_idle(n)
		entity_swimToNode(n, getNode("naijastart"))
		entity_watchForPath(n)
		entity_setRiding(n, n)
		entity_scale(n, 2, 2)
		avatar_toggleCape(false)
		STOPPED = false
	end
end