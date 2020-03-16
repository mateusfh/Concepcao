from inv import *
from mux2 import *
from flopenr import *
from somador import *

def addac(a, sel0, sel1, clk, acc):

    invA = inv(a)

    m1 = mux2(a, invA, sel0)

    y1, cout = somador(a, acc, sel0)

    m2 = mux2(m1, y1, sel1)

    acc = flopenr(clk, 0, 1, m2, acc)

    return m2, cout, acc

