from flopr import *

arqOut = open("flopt.tv", "w")

print("| clk | rst |  d  |  y  |")
for rst in range(2, 0, -1):
    for d in range(0, 2, 1):
        for clk in range(0, 2, 1):
            y = flopr(clk, rst - 1, d)
            print("|  {0}  |  {1}  |  {2}  |  {3}  |".format(clk, rst - 1, d, y))
            arqOut.write("{0}_{1}_{2}_{3}\n".format(clk, rst - 1, d, y))

arqOut.close()