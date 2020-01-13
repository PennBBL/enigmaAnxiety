#!/bin/bash

#They ask that this be done for each group separately.

# 1. Open SubsetByDiagnosis.R and run the relevant code for the anxiety group

# 2. Create the subgroup directory if it doesn't already exist here: /data/jux/BBL/projects/enigmaAnxiety/cortical_output
## 2a. Also add a 'figures' directory to the subgroup directory

# 3. Go to the subgroup/figures directory and link (or copy) the csv file that was created by the R script
# 3a. The names should be "CorticalMeasuresENIGMA_ThickAvg.csv" and "CorticalMeasuresENIGMA_SurfAvg.csv"
### Example (from panic): 
### mkdir -p /data/jux/BBL/projects/enigmaAnxiety/cortical_output/Panic/figures
### cd /data/jux/BBL/projects/enigmaAnxiety/cortical_output/Panic/figures
### ln -s ../../CorticalMeasuresENIGMA_ThickAvg_Panic.csv CorticalMeasuresENIGMA_ThickAvg.csv
### ln -s ../../CorticalMeasuresENIGMA_SurfAvg_Panic.csv CorticalMeasuresENIGMA_SurfAvg.csv

# 4. Then run the following command from within the figures directory:
## R --no-save --slave </data/jux/BBL/projects/enigmaAnxiety/scripts/Cortical/ENIGMA_CortexROI_plots.R

# This will generate a bunch of histogram figures.