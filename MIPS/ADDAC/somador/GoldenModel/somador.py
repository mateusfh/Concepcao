def somador(a, b, carryIn):
    y = a + b + carryIn
    cout = 0
    if y > 1:
        cout = 1
        if y == 2:
            y = 0
        elif y == 3:
            y = 1

    return y, cout