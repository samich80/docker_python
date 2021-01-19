import pickle
import os.path
#d = open("config.json").read()

with open('/work/config/config.conf','rb') as inp:
    d = pickle.load(inp)

if (os.path.exists('/work/infiles/input.txt')):
    file = open('/work/infiles/input.txt', 'r')
    fileInput = file.readlines()
    file.close()

    file = open('/work/outfiles/out.txt', 'w')
    for line in fileInput:
        for character in line:
            if character in d:
                  line = line.replace(character, d[character])
        file.write(line)
    os.remove('/work/infiles/input.txt')
