# -*- coding: utf-8 -*-
"""
Created on Thu Nov 26 19:18:49 2020

@author: jacky
"""
import matplotlib.pyplot as plt
import random
import numpy as np

round = 100000
pos = 0
x = [0]
y = [0]

for i in range(1,round+1):
    prob = random.randint(1, 2)
    if prob == 1:
        pos += 1
    elif prob == 2:
        pos -= 1
    x.append(i)
    y.append(pos)
    
print('Final Position: %d' % pos)
print('Average Displacement: %.4f' % np.average(y))
print('Stand deviattion: %.4f' % np.std(y))

plt.scatter(x, y, color = 'red', marker='.',zorder=2)
plt.plot(x,y,color='green',zorder=1) 
plt.show()
