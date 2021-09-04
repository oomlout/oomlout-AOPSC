print("###########################################")
print("####  AOPSC -- Making Single OPSC File ####")
print("###########################################")

import glob

outputFile = "AOPSC-base.scad"


bas = "c:\\gh\\"

dire = "oomlout-OPSC\\"
read_files = glob.glob(bas + dire + "*.scad")
with open(outputFile, "wb") as outfile:
    for f in read_files:
        with open(f, "rb") as infile:
            print("    Adding: " + str(f))
            outfile.write(infile.read())

dire = "oomlout-OOBB\\"
read_files = glob.glob(bas + dire + "*.scad")
with open(outputFile, "ab") as outfile:
    for f in read_files:
        with open(f, "rb") as infile:
            print("    Adding: " + str(f))
            if "OOBB-build" in str(f) or "OOBB-generate-TRUE" in str(f):
                x=0 ## skip
            else:
                outfile.write(infile.read())



##remove all inserts
file = open(outputFile, "r")
replacement = 'm="";\nw=3;\nh=3;\nextra="NONE";\ns="3DPR";\n$fn = 25;\nOS=15;\n\noi("cube",width=10,height=10,depth=10);\n\n'
# using the for loop
for line in file:
    if "include <" in line or 's="' in line or '$fn' in line or 'OS=' in line:
        replacement = replacement
    else:
        replacement = replacement + line

file.close()
# opening the file in write mode
fout = open(outputFile, "w")
fout.write(replacement)
fout.close()
