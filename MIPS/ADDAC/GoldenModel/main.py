from addac import *


arqOut = open("addac.tv", "w")
print("|  a  | sel0  | sel1  | clk | acc |  s  | cout  |")
acc = 0
for sel0 in range(0, 2, 1):
    for sel1 in range(0, 2, 1):
        for a in range(0, 2, 1):
            for clk in range(0, 2, 1):
                y, cout, acc1 = addac(a, sel0, sel1, clk, acc)
                print("|  {0}  |   {1}   |   {2}   |  {3}  |  {4}  |  {5}  |   {6}   |".format(a, sel0, sel1, clk, acc, y, cout))
                #print("\n")
                arqOut.write("{0}_{1}_{2}_{3}_{4}_{5}_{6}\n".format(a, sel0, sel1, clk, acc, y, cout))
                acc = acc1

arqOut.close()
