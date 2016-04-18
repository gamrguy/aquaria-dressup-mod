-- so this is the file with all the important stuff shared everywhere
-- here's the list of costumes in numerical indexing, for switching the heads about
PATH = "naija/"
COSTUMES = {"naija2", "etc", "cc", "urchin", "mithalan", "teen", "jelly", "mutant", "seahorse", "end", "energyform", "beast", "veggie", "sunform", "zerosuit", "mia", "mithalas_girl1", "mithalas_girl2", "sunkenmom", "priestess", "li", "pirate", "luciengf", "corrupted"}

-- now here's the costume details, indexed by name
-- these show which costume has which unique body parts
-- some have tags that indicate it uses a different set of parts for its complete set (these do not show up in selection)
COSTUMES["naija2"] = {head=true, body=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["etc"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["cc"] = {head=true, body=true, frontarm2=true, frontarm3=true, backarm2=true, backarm3=true, leg2=true, leg3=true}
COSTUMES["urchin"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["mithalan"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["teen"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["jelly"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["mutant"] = {head=true, body=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, leg1=true, leg2=true, leg3=true}
COSTUMES["seahorse"] = {head=true, body=true, frontarm2=true, backarm2=true, frontleg2=true, frontleg3=true, backleg2=true, backleg3=true}
COSTUMES["end"] = {body=true, frontarm2=true, backarm2=true, frontleg2=true, backleg2=true}
COSTUMES["energyform"] = {body=true, frontarm2=true, backarm2=true, frontleg2=true, backleg2=true, frontleg3=true, backleg3=true}
COSTUMES["beast"] = {body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, leg2=true, leg3=true}
COSTUMES["veggie"] = {body=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, leg1=true, leg2=true, leg3=true}
COSTUMES["sunform"] = {body=true, frontarm2=true, backarm2=true, leg2=true, leg3=true}
COSTUMES["zerosuit"] = {body=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["mia"] = {head=true, body=true, frontarm2=true, backarm2=true, frontleg2=true, backleg2=true}
COSTUMES["mithalas_girl1"] = {head=true, body=true, frontarm2=true, backarm2=true, legs="end"}
COSTUMES["mithalas_girl2"] = {head=true, body=true, arms="mithalas_girl1", legs="end"}
COSTUMES["sunkenmom"] = {head=true, body=true, frontarm1=true, backarm1=true, frontleg1=true, backleg1=true}
COSTUMES["priestess"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, backleg1=true, backleg2=true}
COSTUMES["li"] = {head=true, body=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["pirate"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["luciengf"] = {head=true, body=true, frontarm2=true, backarm2=true, frontleg2=true, backleg2=true}
COSTUMES["corrupted"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["capes"] = {"naija2", "etc", "jelly", "mia", "priestess", "sunkenmom", "corrupted"}
-- not all anims, but a nice selection
COSTUMES["anims"] = {"idle", "frozen", "swim", "backflip2", "burst", "trailerintroanim2", "agony", "sitthrone", "changecostume", "energyidle", "energychargeattack", "sitback", "pushforward", "pushback", "walllookup", "dead", "trapped", "trapped2", "sleep",
-- FG's custom ones below
"idledrunk", "idledrunk2", "holdswim", "smashed", "plank", "walk", "run", "stand", "walk2", "walk3", "run2", "standextra-1", "standextra-2", "standextra-3",  "standextra-4", "standextra-5", "liewait", "glide", "glidedown", "glidedown2", "sunbeam", "energyidle2", "energycharge2", "checkoutidle3", "crouch1", "crouch2", "crouch3", "darkspiritidle" }
-- convert capes to LUT
COSTUMES.hascape = {}
for _, cape in pairs(COSTUMES.capes) do
    COSTUMES.hascape[cape] = true
end


-- counters representing the current costume of each part
HEAD = 1
BODY = 1
ARMS = 1
LEGS = 1
ANIM = 1

-- list of bones for ease of reference
HEAD_BONE = 1


function SET_LEGS(set)
	local c = 1
	while(COSTUMES[c] ~= set) do
		c = c + 1
	end
	
	LEGS = c
	
	local costume = COSTUMES[set]
	
	if(costume.leg1) then
		bone_setTexture(FRONTLEG1, PATH..COSTUMES[LEGS].."-leg1")
		bone_setTexture(BACKLEG1, PATH..COSTUMES[LEGS].."-leg1")
	else
		if(costume.frontleg1) then
			bone_setTexture(FRONTLEG1, PATH..COSTUMES[LEGS].."-frontleg1")
		else
			bone_setTexture(FRONTLEG1, PATH.."naija2-frontleg1")
		end
		if(costume.backleg1) then
			bone_setTexture(BACKLEG1, PATH..COSTUMES[LEGS].."-backleg1")
		else
			bone_setTexture(BACKLEG1, PATH.."naija2-backleg1")
		end
	end
	
	if(costume.leg2) then
		bone_setTexture(FRONTLEG2, PATH..COSTUMES[LEGS].."-leg2")
		bone_setTexture(BACKLEG2, PATH..COSTUMES[LEGS].."-leg2")
	else
		if(costume.frontleg2) then
			bone_setTexture(FRONTLEG2, PATH..COSTUMES[LEGS].."-frontleg2")
		else
			bone_setTexture(FRONTLEG2, PATH.."end-frontleg2")
		end
		if(costume.backleg2) then
			bone_setTexture(BACKLEG2, PATH..COSTUMES[LEGS].."-backleg2")
		else
			bone_setTexture(BACKLEG2, PATH.."end-backleg2")
		end
	end
	
	if(costume.leg3) then
		bone_setTexture(FRONTLEG3, PATH..COSTUMES[LEGS].."-leg3")
		bone_setTexture(BACKLEG3, PATH..COSTUMES[LEGS].."-leg3")
	else
		if(costume.frontleg3) then
			bone_setTexture(FRONTLEG3, PATH..COSTUMES[LEGS].."-frontleg3")
		else
			bone_setTexture(FRONTLEG3, PATH.."teen-frontleg3")
		end
		if(costume.backleg3) then
			bone_setTexture(BACKLEG3, PATH..COSTUMES[LEGS].."-backleg3")
		else
			bone_setTexture(BACKLEG3, PATH.."teen-backleg3")
		end
	end
end

function SET_ARMS(set)
	local c = 1
	while(COSTUMES[c] ~= set) do
		c = c + 1
	end
	
	ARMS = c
	
	local costume = COSTUMES[set]
	
	if(costume.frontarm1) then
		bone_setTexture(FRONTARM1, PATH..COSTUMES[ARMS].."-frontarm1")
	else
		bone_setTexture(FRONTARM1, PATH.."naija2-frontarm1")
	end
	if(costume.frontarm2) then
		bone_setTexture(FRONTARM2, PATH..COSTUMES[ARMS].."-frontarm2")
	else
		bone_setTexture(FRONTARM2, PATH.."end-frontarm2")
	end
	if(costume.frontarm3) then
		bone_setTexture(FRONTARM3, PATH..COSTUMES[ARMS].."-frontarm3")
	else
		bone_setTexture(FRONTARM3, PATH.."naija2-frontarm3")
	end
	
	if(costume.backarm1) then
		bone_setTexture(BACKARM1, PATH..COSTUMES[ARMS].."-backarm1")
	else
		bone_setTexture(BACKARM1, PATH.."naija2-backarm1")
	end
	if(costume.backarm2) then
		bone_setTexture(BACKARM2, PATH..COSTUMES[ARMS].."-backarm2")
	else
		bone_setTexture(BACKARM2, PATH.."end-backarm2")
	end
	if(costume.backarm3) then
		bone_setTexture(BACKARM3, PATH..COSTUMES[ARMS].."-backarm3")
	else
		bone_setTexture(BACKARM3, PATH.."naija2-backarm3")
	end
end

function string:splitws()
	local t={} ; local i=1
	for str in self:gmatch("([^%s]+)") do
		t[i] = str
		i = i + 1
	end
    return t
end
