from decoder5x32 import *
from flopenr import *
from mux2 import *

def andBit(a, b):
    andResult = [] 
    for x in range(0, 32, 1):
        y = int(a[x]) and int(b)
        andResult.append(y)
    
    return andResult

def flopenr32(clk, rst, en, d):


def regFile(a1, we, clk, wd):
    d = decoder5x32(a1)

    andResult = andBit(d, we)    

    dataOut = flopenr32(clk, andResult)

    return d, andResult


get_bin = lambda x, n: format(x, 'b').zfill(n)

for we in range(0, 2, 1):
    for wd in range(0, 2, 1):
        for a in range(0, 32, 1):
            for clk in range(0, 2, 1):
                a1 = get_bin(a, 5)
                d, andResult = regFile(a1, we, clk)
                print("{0}_{1}_{2}_{3}".format(a1, we, d, andResult))
