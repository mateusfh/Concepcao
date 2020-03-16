def flopr(clk, rst, d):
    y = 0
    if clk == 1 or rst == 1:
        if (rst): y = 0
        else: y = d
            
    return y