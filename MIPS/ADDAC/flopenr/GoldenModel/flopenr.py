def flopenr(clk, rst, en, d):
    y = "x"

    if clk == 1 or rst == 1:
        if rst: y = 0
        else: 
            if (en): y = d
    
    return y