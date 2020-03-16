def mux2(d0, d1, s):
    y = -1
    if s == 1:
        y = d1
    else:
        y = d0

    #print("mux2: ", y, d0, d1, s)

    return y
