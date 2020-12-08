# -*- coding: utf-8 -*-
"""
Created on Thu Nov 26 19:18:49 2020

@author: jacky
"""
import matplotlib.pyplot as plt
import random
import numpy as np

repeat = 10000
round = 1000
pos_x = 0
pos_y = 0
x = []
y = []

for j in range(repeat):
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
    pos_x = 0
    pos_y = 0

dis = np.sqrt([i**2 + j**2 for i,j in zip(x,y)])

s = 'Repeat: %d\nRounds: %d\nAverage Displacement: %.4f\nStand deviattion: %.4f' % (repeat, round, np.average(dis), np.std(dis))
plt.text(np.min(x), np.max(y), s, style='italic',
        bbox={'alpha': 1, 'pad': 10})

plt.scatter(x, y, color = 'red', marker='.',zorder=2)
plt.show()
