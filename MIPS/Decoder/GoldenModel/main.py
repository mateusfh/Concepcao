from decodicador import *

print("\t\t\tDecodificador\n\tEntrada    _ \t\t\tSaida")

with open('decoder.tv', 'w') as decoder_file:
    for a in range(2):
        for b in range(2):
            for c in range(2):
                for d in range(2):
                    for e in range(2):
                        entrada = [e, d, c, b, a]
                        y = decoder(entrada)
                        decoder_file.write(''.join(str(num) for num in entrada) + '_' + y + '\n')
                        print("{0}_{1}".format(entrada, y))

    decoder_file.close()