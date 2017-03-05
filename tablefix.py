infile = open("pintable.txt", "r")
outfile = open("fixedtable.txt", "w")

i = 0;

for line in infile:
    if line == "Signal Name\n" or line == "FPGA Pin No.\n" or line == "Description\n":
        continue
    if i < 2:
        line = line.strip()
        outfile.write(line + ", ")
        i += 1
    else:
        outfile.write(line)
        i = 0

print("Worked")

infile.close()
outfile.close()
