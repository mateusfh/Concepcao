from somador import *

print("|  A  |  B  | cin |  y  | cout|")
for cin in range(0, 2, 1):
    for b in range(0, 2, 1):
        for a in range(0, 2, 1):
            y, cout = somador(a, b, cin)
            print("|  {0}  |  {1}  |  {2}  |  {3}  |  {4}  |".format(a, b, cin, y, cout))