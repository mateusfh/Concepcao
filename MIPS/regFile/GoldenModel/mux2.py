
def mux2(d0, d1, s):
    if s == 1:
        return d1
    else:
        return d0


def mux2_5bits(d0, d1, s):

    aux = []

    x = 0

    while (x < 16):
         aux.append(mux2(d0[x], d1[x], s[0]))
         x += 1

    x = 0
    aux0 = aux[0:8]
    aux1 = aux[8:16]

    aux.clear()

    while (x < 8):
        aux.append(mux2(aux0[x], aux1[x], s[1]))
        x += 1
    
    x = 0

    aux0 = aux[0:2]
    aux1 = aux[2:4]
    
    aux.clear()

    while (x < 2):
        aux.append(mux2(aux0[x], aux1[x], s[2]))
        x += 1 

    return mux2(aux[0], aux[1], s[4])

get_bin = lambda x, n: format(x, 'b').zfill(n)


for sel in range(0, 32, 1):
    s = get_bin(sel, 5)
    aux = get_bin(2**sel, 32)
    d0 = aux[0:16]
    d1 = aux[16:32]

    y = mux2_5bits(d0, d1, s)
    
