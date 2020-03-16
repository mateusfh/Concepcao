from mux4 import *

muxOut = open("mux4.tv", "w")

print("| d0 | d1 | d2 | d3 | s0 | s1 | y |")

for s1 in range(0, 2, 1):
    for s0 in range(0, 2, 1):
        for d3 in range(0, 2, 1):
            for d2 in range(0, 2, 1):
                for d1 in range(0, 2, 1):
                    for d0 in range(0, 2, 1):
                        y = mux4(d0, d1, d2, d3, s0, s1)
                        print("|  {0} |  {1} |  {2} |  {3} |  {4} |  {5} | {6} |" .format(d0, d1, d2, d3, s0, s1, y))
                        muxOut.write("{0}_{1}_{2}_{3}_{4}_{5}_{6}\n" .format(d0, d1, d2, d3, s0, s1, y))
            
muxOut.close()