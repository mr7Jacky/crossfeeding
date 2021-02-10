# Cross-feeding Exploration and 2-D Model Simulation

#### The Basic Idea: [Cross-feeding exploration](doc/crossfeeding_jd_param.pdf)

#### The Model and Simulator (Based on C++)
All modelling code file is on the directory [Simulator](simulator/). 

USAGE: 
1. Compiling the code:
```bash
make <model-type>
```
	* There are five types of model types:
	1. commensalism
	2. syntrophy
	3. syntrophy-tox
	4. mutualism
	5. mutualism-tox

2. To start the modelling, use the following shell command:
```bash
./<model-type> <parameter> <number-output-files> <output-directory>
```

3. All output files is a matrix containing in a `.txt` file, all of which will be in the output-directory.

#### The Visualization code
Provided with visualization code written in `Matlab` in the [matrixDecoder](matrixDecoder/). 

All functions of visualization contain in the file [run.m](matrixDecoder/run.m)

> Before use the run.m use add the folder and its subfolder to the path in matlab

Currently support functions
1. Create the `.gif` file to illustrate:
	* the change of the distribution of different types of cells 
	* the concentration of the nutrients
2. Plot the radius of the matrix as a function of time
*(The radius refers to the average of furthest data points from center)*
3. Plot the population of the bacteria
4. Plot the distribution of the nutrient along with x-axis or y-axis

#### The database
All current output data are store in [Data](Data/). 

Currently tested:
1. Equal parameters (with toxicity / without toxicity)
2. Excretion B 10 times larger than excretion A

#### Reports
All report will be store in the directory [report](report/)

#### Data
Data file is in Google Drive [Shareable Link](https://drive.google.com/drive/folders/1fOVzEPXWOSJHuBxPpb_0kg8kqXtLFrDx?usp=sharing)
