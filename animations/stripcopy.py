def start_thing():
    input = raw_input("Yo! Tell me what file you're targeting. No file extensions please.\n")
    xml = open(input+".xml", "rw")
    
    input = raw_input("\nOkay, now tell me what to do.\nCommands:\ncopy_strips, cleanup, remove_bone")
    cmds = input.split(" ")
    
    bonesToRemove = []
    stripsToCopy = []
    do_cleanup = False
    
    if "copy_strips" in cmds:
        stripsToCopy.append([int(cmds[1]), int(cmds[2])])
    elif "remove_bone" in cmds:
        bonesToRemove.append(int(cmds[1]))
    elif "cleanup" in cmds:
        do_cleanup = True
    
    lines = xml.read().split("\n")
    xml.close()
    newxml = ""
    
    bones = []
    
    for line in lines:
        if "<Key e=\"" in line or "<Key lerp=\"" in line:
            print("Hey! I found an animation key!")
            vals = line.split(" ")
            parsed = parse_key(vals)
            
            for copy in stripsToCopy:
                copy_strips(parsed, copy[0], copy[1])
            #copy_strips(parsed, 0, 15)
            #Rebuilding from parsed key
            lerp = False
            if "<Key lerp=\"" in line: 
                lerp = True
            newline = "        <Key e=\""
            if lerp:
                newline += "lerp=\""+str(parsed["lerp"])+"\" "
            for thing in parsed:
                if thing != "lerp":
                    newline += str(thing)+" "
                    for otherThing in parsed[thing]:
                        newline += str(otherThing)+" "
            newline += "\"/>"
            print newline
            line = newline
            
            
        elif "    <Bone " in line or "\t<Bone " in line:
            if "\t<Bone " in line:
                nextQuote = line[12:].index("\"")+12
                bones.append(int(line[12:nextQuote]))
            else:
                nextQuote = line[15:].index("\"")+15
                bones.append(int(line[15:nextQuote]))
        
        newxml+=line+"\n"
    
    test = open("cool.xml", "w")
    test.write(newxml)
    test.close()
    print(bones)

def parse_key(key):
    parsedKey = {}
    withinBone = -1
    withinBoneCount = -1
    stripsAmt = 0
    for thing in key:
        if(thing[0:4] == "lerp"):
            parsedKey["lerp"] = float(thing[6:7])
        elif(thing == "" or thing == "<Key" or thing[0:3] == "e=\"" or thing == "\"/>"):
            pass
        elif withinBone != -1:
            withinBoneCount+=1
            parsedKey[withinBone].append(float(thing))
            if withinBoneCount == 3:
                stripsAmt = int(thing) * 2
            if withinBoneCount == 3+stripsAmt:
                withinBone = -1
                withinBoneCount = -1
        else:
            withinBone = int(thing)
            parsedKey[int(thing)] = []
    return parsedKey
        
def copy_strips(parsedKey, bone1, bone2):
    parsedKey[bone2][3:] = parsedKey[bone1][3:]


start_thing()