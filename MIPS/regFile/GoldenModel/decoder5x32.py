def inv(bit):
    if bit:
        return 0
    else:
        return 1

def decoder2x4(entrada):
    saida = [0]*4
    saida[0] = inv(entrada[0]) and inv(entrada[1])
    saida[1] = entrada[0] and inv(entrada[1])
    saida[2] = inv(entrada[0]) and entrada[1]
    saida[3] = entrada[0] and entrada[1]
    return saida


def decoder3x8(entrada, enable):
    saida = [0]*8
    if enable == 1:
        saida[0] = inv(entrada[0]) and inv(entrada[1]) and inv(entrada[2])
        saida[1] = entrada[0] and inv(entrada[1]) and inv(entrada[2])
        saida[2] = inv(entrada[0]) and entrada[1] and inv(entrada[2])
        saida[3] = entrada[0] and entrada[1] and inv(entrada[2])
        saida[4] = inv(entrada[0]) and inv(entrada[1]) and entrada[2]
        saida[5] = entrada[0] and inv(entrada[1]) and entrada[2]
        saida[6] = inv(entrada[0]) and entrada[1] and entrada[2]
        saida[7] = entrada[0] and entrada[1] and entrada[2]
        
    return saida

def decoder5x32(entrada):
    saida = [0]*32
    
    enable = decoder2x4([int(entrada[1]), int(entrada[0])])

    saida[0:8] = decoder3x8([int(entrada[4]), int(entrada[3]), int(entrada[2])], enable[0])
    saida[8:16] = decoder3x8([int(entrada[4]), int(entrada[3]), int(entrada[2])], enable[1])
    saida[16:24] = decoder3x8([int(entrada[4]), int(entrada[3]), int(entrada[2])], enable[2])
    saida[24:32] = decoder3x8([int(entrada[4]), int(entrada[3]), int(entrada[2])], enable[3])

    saida_str = ''.join(str(num) for num in saida)
    return saida_str


