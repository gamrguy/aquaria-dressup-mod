# This script creates XML files for each costume.
# These files only consist of the head,allowing for 
# better control over the character's clothing.

from io import FileIO

top = "<Bones>\n"
bottom = "</Bones>"
path = "animations/skins/"

head = 1

def getXMLTag(idx, path):
    return "    <Bone idx=\""+str(idx)+"\" gfx=\"Naija/"+path+"\"  />\n"

#This is used for single-body-part files
def writeCostumeFile(idx, path, name):
    file = FileIO(path, 'w')
    file.write(top)
    file.write(getXMLTag(idx, name))
    file.write(bottom)
    file.close()

def writeHeadForSet(setName):
    writeCostumeFile(head, path+setName+".xml", setName+"-head")

writeHeadForSet("etc")
writeHeadForSet("cc")
writeHeadForSet("seahorse")
writeHeadForSet("teen")
writeHeadForSet("jelly")
writeHeadForSet("urchin")
writeHeadForSet("mithalan")
writeHeadForSet("mutant")
writeHeadForSet("zerosuit")
writeHeadForSet("mia")
writeHeadForSet("mithalas_girl1")
writeHeadForSet("mithalas_girl2")
writeHeadForSet("sunkenmom")