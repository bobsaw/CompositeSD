# CompositeSD
This is an R translation of David A. Burton's Python library "composite_sd.py".  He has not endorsed or vetted this code.

Calculate combined standard deviation from multiple group means and standard debiations via ANOVA (ANalysis Of VAriance) 

See:  http://www.burtonsys.com/climate/composite_standard_deviations.html
Inputs are:
means, the vector of group means
SDs, the vector of group standard deviations
ncounts, a vector containing the number of samples in each group (can be 
scalar if all groups have same number of samples)
Result is the overall standard deviation.