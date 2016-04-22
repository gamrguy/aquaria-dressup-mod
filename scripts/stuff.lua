-- so this is the file with all the important stuff shared everywhere
-- here's the list of costumes in numerical indexing, for switching the heads about
PATH = "naija/"
COSTUMES = {"naija2", "etc", "cc", "urchin", "mithalan", "teen", "jelly", "mutant", "seahorse", "end", "energyform", "beast", "veggie", "sunform", "mia", "mithalas_girl1", "mithalas_girl2", "sunkenmom", "priestess", "li", "pirate", "luciengf", "corrupted"}

-- now here's the costume details, indexed by name
-- these show which costume has which body parts
-- head, body, arms, or legs followed by text indicates it uses that costume's part(s) instead
-- a bald tag means there is no helmet, useDefaultHair adds the default hair for that form (under helmet)
-- and noEars removes the ears from Naija's head (which are located behind the hair)
COSTUMES["naija2"] = {frontarm2=true, backarm2=true, leg2=true, leg3=true}
COSTUMES["etc"] = {noEars=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, backleg1=true, leg2=true, leg3=true}
COSTUMES["cc"] = {noEars=true, frontarm2=true, frontarm3=true, backarm2=true, backarm3=true, leg2=true, leg3=true}
COSTUMES["urchin"] = {noEars=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, leg2=true, leg3=true}
COSTUMES["mithalan"] = {usesDefaultHair=true, frontarm2=true, backarm2=true, leg1=true, leg2=true, leg3=true}
COSTUMES["teen"] = {frontarm2=true, backarm2=true, leg2=true}
COSTUMES["jelly"] = {noEars=true, frontarm2=true, backarm2=true, leg2=true}
COSTUMES["mutant"] = {noEars=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, leg1=true, leg2=true, leg3=true}
COSTUMES["seahorse"] = {noEars=true, frontarm2=true, backarm2=true, leg2=true, leg3=true}
COSTUMES["end"] = {head="naija2"}
COSTUMES["energyform"] = {frontarm2=true, backarm2=true, leg2=true, leg3=true}
COSTUMES["beast"] = {noEars=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, leg2=true, leg3=true}
COSTUMES["veggie"] = {frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, leg2=true, leg3=true}
COSTUMES["sunform"] = {head="naija2", frontarm2=true, backarm2=true, leg2=true, leg3=true}
--zerosuit was cool, but doesn't play nice with new system (feet, full body coverage, etc.)
--COSTUMES["zerosuit"] = {head="naija2", frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["mia"] = {frontarm2=true, backarm2=true, leg2=true}
COSTUMES["mithalas_girl1"] = {frontarm2=true, backarm2=true, legs="end"}
COSTUMES["mithalas_girl2"] = {arms="mithalas_girl1", legs="end"}
COSTUMES["sunkenmom"] = {frontarm1=true, backarm1=true, leg1=true}
COSTUMES["priestess"] = {frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, leg1=true, leg2=true}
--TODO: decide whether to keep Li costume in, as it's another fullbody overlay (though doesn't have feet problems)
COSTUMES["li"] = {frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, leg1=true, leg2=true, leg3=true}
COSTUMES["pirate"] = {frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, backleg1=true, backleg2=true, leg3=true}
COSTUMES["luciengf"] = {frontarm2=true, backarm2=true, leg2=true}
COSTUMES["corrupted"] = {usesDefaultHair=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg2=true, backleg2=true}
COSTUMES["hascape"] = {naija2=true, etc=true, jelly=true, mia=true, priestess=true, sunkenmom=true, corrupted=true, veggie=true}

--Defines what the default hair is for each form
COSTUMES["default_hair"] = {"naija2", "energyform", "beast", "veggie", 0, 0, 0, "sunform"}
--Defines what the ears are for each form
COSTUMES["ears"] = {"naija2", "energyform", "beast", "veggie", 0, 0, 0, "sunform"}

-- not all anims, but a nice selection
COSTUMES["anims"] = {"idle", "frozen", "swim", "backflip2", "burst", "trailerintroanim2", "agony", "sitthrone", "changecostume", "energyidle", "energychargeattack", "sitback", "pushforward", "pushback", "walllookup", "dead", "trapped", "trapped2", "sleep",
-- FG's custom ones below
"idledrunk", "idledrunk2", "holdswim", "smashed", "plank", "walk", "run", "stand", "walk2", "walk3", "run2", "standextra-1", "standextra-2", "standextra-3",  "standextra-4", "standextra-5", "liewait", "glide", "glidedown", "glidedown2", "sunbeam", "energyidle2", "energycharge2", "checkoutidle3", "crouch1", "crouch2", "crouch3", "darkspiritidle" }
-- convert capes to LUT
--DEPRECATED: Why do this when you can just create the initial values correctly?
--COSTUMES.hascape = {}
--for _, cape in pairs(COSTUMES.capes) do
--    COSTUMES.hascape[cape] = true
--end


-- the anim counter. may be removed soon
ANIM = 1