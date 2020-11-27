# -*- coding: utf-8 -*-
"""
Created on Thu Nov 26 19:18:49 2020

@author: jacky
"""
import matplotlib.pyplot as plt
import random

round = 1000
pos_x = 0
pos_y = 0
x = [0]
y = [0]

for i in range(1,round+1):
    prob = random.randint(1, 4)
    if prob == 1:
        pos_y += 1
    elif prob == 2:
        pos_y -= 1
    elif prob == 3:
        pos_x += 1
    else:
        pos_x -= 1
    x.append(pos_x)
    y.append(pos_y)

plt.scatter(x, y, color = 'red', marker='.',zorder=2)
plt.plot(x,y,color='green',zorder=1) 
plt.show()
