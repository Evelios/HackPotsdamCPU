infile = open("fibo", "r")
outfile = open("fibo_rom.txt", "w")

i = 0

for line in infile:
    bin_string = line.strip()
    outfile.write("    " + str(i) + " : " + bin_string + ";\n")
    i += 1    

print("Worked")

infile.close()
outfile.close()
