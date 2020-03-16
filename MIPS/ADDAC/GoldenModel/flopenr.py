def flopenr(clk, rst, en, d, acc):
    y = acc
    if clk == 1 or rst == 1:
        if rst: y = 0
        else: 
            if (en): y = d
    #print("Flopenr: ", y, clk, rst, en, d)
    return y