from inv import *


print("|  A  |  Y  |")
for a in range (0, 2, 1):
    y = inv(a)
    print("|  {0}  |  {1}  |".format(a, y))