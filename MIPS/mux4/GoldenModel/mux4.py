from mux2 import *

def mux4(d0, d1, d2, d3, s0, s1):
    y1 = mux2(d0, d1, s0)
    y2 = mux2(d2, d3, s0)

    return mux2(y1, y2, s1)