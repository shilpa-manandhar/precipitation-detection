# A Data-driven Approach to Detect Precipitation from Meteorological Sensor Data

With the spirit of reproducible research, this repository contains all the codes required to produce the results in the manuscript: 

> S. Manandhar, S. Dev, Y. H. Lee and Y. S. Meng, " A Data-driven Approach to Detect Precipitation from Meteorological Sensor Data", in Proc. *IEEE IGARSS*, Valencia, Spian, 2018.

Please cite the above paper if you intend to use whole/part of the code. This code is only for academic and research purposes.

The GPS and Weather station data from singpaore (NTU station) which has been used for the paper are also made available.

## Manuscript
The author version of this manuscript is manuscript.PDF.

## Code Organization
All codes are written in MATLAB. 

## Dataset
The dataset used in this manuscript is GPS PWV data derived using GIPSY/OASIS II software using RINEX files for IGS station from Singapore (NTUS). The data files also consist of the weather station data. Weather station is collocated to the GPS station.

## Core functionality
* `TimeSeries_Plot.m` plots the time series of different weather variables and rain.
* TrainTestResults.m generates the training and testing at different % of train data size

