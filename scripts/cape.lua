-- FG: from our sequel mod, hacked in shape to work without the full scripting framework

local sin = math.sin
local cos = math.cos

local function vector_fromDeg(r, len)
    -- simplified formula for x == 0
    local a = r * (3.14159265359 / 180.0)
    if len then
        return sin(a)*len, -cos(a)*len
    end
    
    return sin(a), -cos(a)
end

---------------------------------------------------------------------

-- FIXME: respect v.e entity color -> put same color on hair

v.e = 0 -- attached to this entity
v.b = 0 -- (optional) attached to this bone on above entity
v.btex = 0 -- (optional) copy tex from this bone
v.accuT = 0
v.tex = false -- cached texture
v.inverseForceMult = 0
v.ovtex = false
v.oldDivisions = false
v.oldLengthPerDivision = false
v.oldWidth = false


function init(me)
    setupEntity(me)
    entity_setVisible(me, false)
    
    entity_setDeathSound(me, "")
    entity_setDeathParticleEffect(me, "")
    esetv(me, EV_LOOKAT, 0)
    esetv(me, EV_NOAVOID, 1)
    entity_setUpdateCull(me, -1) -- alwaye update
    entity_setAllDamageTargets(me, false)
    entity_setSpiritFreeze(me, false)
    entity_setCollideRadius(me, 0)
    entity_setEntityType(me, ET_NEUTRAL)
end

function postInit(me)

end

-- don't ask me why this works, or how it works.
-- it's roughly adapted from Avatar.cpp::updateHair(),
-- but i can't really grok what it does.
local function updateForce(me, dt)
    local fh = entity_isfh(v.e)
    local onwall = avatar_isOnWall() --entity_isOnWall(v.e)
    local hlen = 21
    local hx, hy = vector_fromDeg(entity_getRotation(me), hlen)
    local diff2x, diff2y
    if fh then
        diff2x, diff2y = hy, -hx
    else
        diff2x, diff2y = -hy, hx
    end
    
    
    local diff3x = -hx
    local diff3y = -hy
    
    if onwall then
        if fh then
            diff3x, diff3y = -50, -25
        else
            diff3x, diff3y = 50, -25
        end
    end
    
    diff3x, diff3y = vector_setLength(diff3x, diff3y, hlen)
    local t = v.accuT
    if t > 1 then
        t = 1 - (v.accuT - 1)
    end
    local frc = 0.333333
    local f = frc*(1-(t*0.5))
    hx = diff2x*f + diff3x*frc
    hy = diff2y*f + diff3y*frc + hlen*(frc*(0.5+t*0.5))
    
    hx, hy = vector_setLength(hx, hy, 400)
    
    --debugLog(string.format("hair: %.3f, %.3f, t: %.3f", hx, hy, t))
    
    -- influence by currents
    entity_updateCurrents(me, dt)
    local vx, vy = entity_getVel2(me)
    hx = hx + vx * 3.2 -- magic number; looks ok mostly
    hy = hy + vy * 3.2
    entity_clearVel2(me)
    
    if not entity_isUnderWater(me) then
        hx = hx * 0.3
        hy = hy * 0.6
        hy = hy + 300
        
        if isObstructed(entity_getHairPosition(me, v.oldDivisions*0.7)) or isObstructed(entity_getHairPosition(me, v.oldDivisions*0.5)) or isObstructed(entity_getHairPosition(me, v.oldDivisions-1)) then
            hx = hx * 0.1
            hy = hy * 0.1
        end
    end
    
    
    entity_exertHairForce(me, hx, hy, dt)
    
    local invf = v.inverseForceMult
    if invf ~= 0 then
        entity_exertHairForce(me, hx*invf, hy*invf, dt, 1)
    end
end


function update(me, dt)
    v.accuT = (v.accuT + dt) % 2
    local e = v.e
    if e ~= 0 then
        --[[if not entity_isValid(e) then
            v.e = 0
            entity_setState(me, STATE_DEAD)
            return
        else]]if v.b ~= 0 then
            local wx, wy, wr = bone_getWorldPositionAndRotation(v.b)
            entity_setPosition(me, wx, wy)
            entity_rotate(me, wr)
        else
            entity_setPosition(me, entity_getPosition(e))
            entity_rotate(me, entity_getWorldRotation(e))
        end
        entity_color(me, entity_getColor(e))
        entity_alpha(me, entity_getAlpha(e))
        
        local h = entity_getHair(me)
        if h ~= 0 then
            local a = entity_getAlpha(e)
            local tex = v.ovtex
            if v.btex ~= 0 then
                tex = tex or bone_getTexture(v.btex)
                a = a * bone_getAlpha(v.btex)
            end
            if tex ~= v.tex then
                obj_setTexture(h, v.ovtex or tex)
                v.tex = tex
            end
            obj_alpha(h, a)
        end
        
        entity_setHairHeadPosition(me, entity_getPosition(me))
        
        if not isWorldPaused() then
            updateForce(me, dt)
        end
        entity_updateHair(me, dt)
    end
end

-- "hairdata": tex, divisions, lengthPerDivision, width, inverseForceMult
function msg(me, s, ...)
    if s == "attach" then
        local e, b, btex = ...
        v.e = e or 0
        v.b = b or 0
        v.btex = btex or 0
    elseif s == "hairdata" then
        local tex, divisions, lengthPerDivision, width, inverseForceMult, pass, layer = ...
        divisions = divisions or 40
        lengthPerDivision = lengthPerDivision or 3
        width = width or 18
        tex = tex or "naija/cape"
        pass = pass or -1
        v.inverseForceMult = inverseForceMult or 0
        if v.oldDivisions ~= divisions or v.oldLengthPerDivision ~= lengthPerDivision or v.oldWidth ~= width then
            entity_clearHair(me)
            entity_initHair(me, divisions, lengthPerDivision, width, tex)
            v.oldDivisions = divisions
            v.oldLengthPerDivision = lengthPerDivision
            v.oldWidth = width
        else
            obj_setTexture(entity_getHair(me), tex)
        end
        obj_setRenderPass(entity_getHair(me), pass)
        if layer then
            entity_setLayer(me, layer)
            obj_setLayer(entity_getHair(me), layer)
        end
    elseif s == "visible" then
        local h = entity_getHair(me)
        if h ~= 0 then
            local on = ...
            if on then
                obj_alphaMod(h, 1)
            else
                obj_alphaMod(h, 0)
            end
        end
    elseif s == "overridetex" then
        local tex = (...) or false
        if tex == "" then
            tex = false
        end
        v.ovtex = tex
    end
end

