--[[
This file sets all the important stuff needed by other nodes.

In this case, the lists of available clothing items and
what sets they belong in. And keeps track of current selected items.

Also keeps Naija with the correct clothing items.
]]--

dofile("scripts/stuff.lua")

local SCALE_DEFAULT = 0.5
local SCALE = 1.6

v.cape = 0
v.capebone = 0
v.oldBODY = -1
v.head = 1
v.currentCape = 1

local function updateCape(s)
    if v.cape == 0 then
        return
    end
    local sx, sy = entity_getScale(getNaija())
    local c = COSTUMES[s]
    local has = COSTUMES.hascape[c]
    entity_msg(v.cape, "visible", has)
    if has then
        local tex = "naija/cape"
        if c ~= "naija2" then
            tex = tex .. "-" .. c
        end
        bone_setTexture(v.capebone, tex)
        entity_msg(v.cape, "hairdata", tex, nil, 4*sx, 22*sy)
    end
    return true
end

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
	
	updateCape(v.currentCape)
end

local function stop()
    local n = getNaija()
    STOPPED = true
    entity_setRiding(n, nil)
    entity_scale(n, SCALE_DEFAULT, SCALE_DEFAULT)
    if not updateCape() then -- show internal cape only if not using custom cape
        avatar_toggleCape(COSTUMES.hascape[COSTUMES[BODY]])
    end
    ANIM = 1
    entity_idle(n)
end

function init(me)
    local n = getNaija()
    v.capebone = entity_getBoneByName(n, "Cape")
    local capepos = entity_getBoneByName(n, "CapePos")
    if v.capebone ~= 0 and capepos ~= 0 then
        v.cape = createEntity("cape")
        entity_msg(v.cape, "attach", n, capepos, v.capebone)
    end
    start(true)
end

function update(me, dt)
    if not STOPPED then
        avatar_toggleCape(false)
    end
end

function msg(me, msg, msg2)
	if msg == "stop" then
        stop()
	elseif msg == "start" then
        start()
	elseif msg == "cape" then
		v.currentCape = msg2
		updateCape(msg2)
	end
end