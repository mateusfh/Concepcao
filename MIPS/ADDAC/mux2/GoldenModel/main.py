from mux2 import *


print("| d0 | d1 | s | y |")
for s in range(0, 2):
    for d1 in range(0, 2, 1):
        for d0 in range(0, 2, 1):
            y = mux2(d0, d1, s)
            print("|  {0} |  {1} | {2} | {3} |" .format(d0, d1, s, y))