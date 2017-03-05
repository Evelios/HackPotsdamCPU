infile = open("fibo.hex", "r")
outfile = open("fibo", "w")

scale = 16 ## equals to hexadecimal

num_of_bits = 8

for line in infile:
    hex_string = line.strip()
    outfile.write(bin(int(hex_string, scale))[2:].zfill(num_of_bits))
    outfile.write("\n")

print("Worked")

infile.close()
outfile.close()
