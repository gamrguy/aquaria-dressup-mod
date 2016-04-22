def start_thing():
    input = raw_input("Yo! Tell me what file you're targeting. No file extensions please.\n")
    xml = open(input+".xml", "rw")
    
    body_startval = 36
    body_endval = 61
    armor_startval = 166
    
    lines = xml.read().split("\n")
    xml.close()
    newxml = ""
    for line in lines:
        if "<Key e=\"" in line or "<Key lerp=\"" in line:
            print("Hey! I found an animation key!")
            vals = line.split(" ")
            lerp = False
            if "<Key lerp=\"" in line:
                body_strips = vals[body_startval:body_endval]
                armor_strips = vals[armor_startval+1:-1]
                
                lerp = True
            else:
                body_strips = vals[body_startval-1:body_endval-1]
                armor_strips = vals[armor_startval:-1]
            body_strips[:0] = ["0", "0", "0"]
            
            print(body_strips)
            print(armor_strips)
            
            if len(vals) > 131 and armor_strips != []:
                armor_strips = body_strips
                if lerp:
                    vals[armor_startval+1:-1] = body_strips
                    #print vals[armor_startval+1:-1]
                else:
                    vals[armor_startval:-1] = body_strips
                    #print vals[armor_startval:-1]
                newline = ""
                for thing in vals:
                    newline += thing+" "
                newline = newline[:-1]
                #print line
                #print newline
                line = newline
        newxml+=line+"\n"
    
    test = open("cool.xml", "w")
    test.write(newxml)
    test.close()
    
start_thing()