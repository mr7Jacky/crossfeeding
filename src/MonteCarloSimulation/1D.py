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
pos = 0
x = []
y = []

for j in range(repeat):
    for i in range(1,round+1):
        prob = random.randint(1, 2)
        if prob == 1:
            pos += 1
        elif prob == 2:
            pos -= 1
    x.append(j)
    y.append(pos)
    pos = 0


s = 'Repeat: %d\nRounds: %d\nAverage Displacement: %.4f\nStand deviattion: %.4f' % (repeat, round, np.average(y), np.std(y))

plt.text(0, np.max(y), s, style='italic',
        bbox={'alpha': 1, 'pad': 10})
plt.scatter(x, y, color = 'red', marker='.',zorder=2)
plt.plot(x,y,color='green',zorder=1) 
plt.show()
