--[[
This file sets all the important stuff needed by other nodes.

In this case, the lists of available clothing items and
what sets they belong in. And keeps track of current selected items.

Also keeps Naija with the correct clothing items.
]]--

dofile("scripts/stuff.lua")

local SCALE_DEFAULT = 0.5
local SCALE = 1.6

local function start(init)
    local n = getNaija()
    local pos = getNode("naijastart")
    if init then
        entity_setPosition(n, node_getPosition(pos))
    else
        avatar_fallOffWall()
        entity_idle(n)
        entity_swimToNode(n, pos)
        entity_watchForPath(n)
    end
    entity_setRiding(n, n) -- HACK: ignore input/movement and everything
    entity_scale(n, SCALE, SCALE)
    avatar_toggleCape(false)
    STOPPED = false
end

local function stop()
    local n = getNaija()
    STOPPED = true
    entity_setRiding(n, nil)
    entity_scale(n, SCALE_DEFAULT, SCALE_DEFAULT)
    avatar_toggleCape(COSTUMES.hascape[COSTUMES[BODY]])
    ANIM = 1
    entity_idle(n)
end

function init(me)
    start(true)
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
end

function msg(me, msg)
	if(msg == "stop") then
        stop()
	elseif(msg == "start") then
        start()
	end
end
