-- so this is the file with all the important stuff shared everywhere
-- here's the list of costumes in numerical indexing, for switching the heads about
PATH = "naija/"
COSTUMES = {"naija2", "etc", "cc", "urchin", "mithalan", "teen", "jelly", "mutant", "end", "zerosuit", "mia", "mithalas_girl1", "mithalas_girl2", "sunkenmom", "priestess", "li", "pirate", "luciengf"}

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
COSTUMES["end"] = {body=true, frontarm2=true, backarm2=true, frontleg2=true, backleg2=true}
COSTUMES["zerosuit"] = {body=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["mia"] = {head=true, body=true, frontarm2=true, backarm2=true, frontleg2=true, backleg2=true}
COSTUMES["mithalas_girl1"] = {head=true, body=true, frontarm2=true, backarm2=true, legs="end"}
COSTUMES["mithalas_girl2"] = {head=true, body=true, arms="mithalas_girl1", legs="end"}
COSTUMES["sunkenmom"] = {head=true, body=true, frontarm1=true, backarm1=true, frontleg1=true, backleg1=true}
COSTUMES["priestess"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, backleg1=true, backleg2=true}
COSTUMES["li"] = {head=true, body=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["pirate"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["luciengf"] = {head=true, body=true, frontarm2=true, backarm2=true, frontleg2=true, backleg2=true}
COSTUMES["capes"] = {"naija2", "etc", "jelly", "mia", "priestess", "sunkenmom"}
-- counters representing the current costume of each part
HEAD = 1
BODY = 1
ARMS = 1
LEGS = 1

-- list of bones for ease of reference
HEAD_BONE = 1

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

function SET_LEGS(costume)
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

function SET_ARMS(costume)
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