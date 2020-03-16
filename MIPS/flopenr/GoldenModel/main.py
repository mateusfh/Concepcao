from flopenr import *

arqOut = open("flopenr.tv", "w")

print("| clk | rst |  en  |  d  |  y  |")

for rst in range(0, 2, 1):
    for en in range(0, 2, 1):
        for clk in range(0, 2, 1):
            for d in range(0, 2, 1):
                y = flopenr(clk, rst, en, d)
                print("|  {0}  |  {1}  |   {2}  |  {3}  |  {4}  |".format(clk, rst, en, d, y))
                arqOut.write("{0}_{1}_{2}_{3}_{4}\n".format(clk, rst, en, d, y))


arqOut.close()