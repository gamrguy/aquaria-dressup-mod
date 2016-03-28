-- here we have a lot of "global" stuff that apparently isn't "really" global. lol.
-- here's the list of costumes in numerical indexing, for switching the heads about
PATH = "naija/"
COSTUMES = {"naija2", "etc", "cc", "mithalan", "teen", "jelly", "mutant", "end", "zerosuit", "mia", "mithalas_girl1", "mithalas_girl2"}

-- now here's the costume details, indexed by name
-- these show which costume has which unique body parts
-- some have tags that indicate it uses a different set of parts for its complete set (these do not show up in selection)
COSTUMES["naija2"] = {head=true, body=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["etc"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["cc"] = {head=true, body=true, frontarm2=true, frontarm3=true, backarm2=true, backarm3=true, leg2=true, leg3=true}
COSTUMES["mithalan"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["teen"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["jelly"] = {head=true, body=true, frontarm1=true, frontarm2=true, backarm1=true, backarm2=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["mutant"] = {head=true, body=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, leg1=true, leg2=true, leg3=true}
COSTUMES["end"] = {body=true, frontarm2=true, backarm2=true, frontleg2=true, backleg2=true}
COSTUMES["zerosuit"] = {body=true, frontarm1=true, frontarm2=true, frontarm3=true, backarm1=true, backarm2=true, backarm3=true, frontleg1=true, frontleg2=true, frontleg3=true, backleg1=true, backleg2=true, backleg3=true}
COSTUMES["mia"] = {head=true, body=true, frontarm2=true, backarm2=true, frontleg2=true, backleg2=true}
COSTUMES["mithalas_girl1"] = {head=true, body=true, frontarm2=true, backarm2=true, legs="end"}
COSTUMES["mithalas_girl2"] = {head=true, body=true, arms="mithalas_girl1", legs="end"}

-- counters representing the current costume of each part
HEAD = 1
BODY = 1
ARMS = 1
LEGS = 1

-- list of bones for ease of reference
HEAD_BONE = 1
BODY_BONE = 0
BACKARM1_BONE = 4
BACKARM2_BONE = 5
BACKARM3_BONE = 10
FRONTARM1_BONE = 2
FRONTARM2_BONE = 3
FRONTARM3_BONE = 11
BACKLEG1_BONE = 6
BACKLEG2_BONE = 7
BACKLEG3_BONE = 12
FRONTLEG1_BONE = 8
FRONTLEG2_BONE = 9
FRONTLEG3_BONE = 13