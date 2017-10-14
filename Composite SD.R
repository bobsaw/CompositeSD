#  This is an R translation of David A. Burton's Python library 
#"composite_sd.py".  He has not endorsed or vetted this code.

# Calculate combined standard deviation via ANOVA (ANalysis Of VAriance)
#        See:  http://www.burtonsys.com/climate/composite_standard_deviations.html
# Inputs are:
# means, the vector of group means
# SDs, the vector of group standard deviations
# ncounts, a vector containing the number of samples in each group (can be 
# scalar if all groups have same number of samples)
# Result is the overall standard deviation.

composite_SD <- function(means, SDs, ncounts){
  G <- length(means)  #number of groups
  if(G != length(SDs)){
    print("Error:  means != SDs")
    stop()
  }
  if(length(ncounts)==1){
    ncounts <- rep(ncounts, G)  #Convert scalar ncounts to array
  } else if(G != length(ncounts)) {
    print("Wrong ncounts list length")
    stop()
  }
  #Calculates total number of samples (N), and grand mean (GM)
  N= sum(ncounts)
  if(N <= 1){
    print("Error:  SD is incalculable")
    stop()
  }
  GM <- weighted.mean(means, ncounts)
  
  #Calculate Error Sum of Squares
  ESS <- 0
  ESS <- sum(((SDs)^2)*(ncounts - 1))
  
  #Calculate Total Group Sum of Squares
  TGSS <- 0
  TGSS <- sum(((means - GM)^2) * ncounts)
  
  #Calculate standard deviation as square root of grand variance
  result <- sqrt((ESS + TGSS)/(N-1))
  return(result)
}




# Unit testing ------------------------------------------------------------
# samples <- 0:9
# print(paste('avg =', mean(samples)))
# sd <- sd(samples)
# print(paste('sd = ', sd))
# pt1 <-  c(0,1,2)
# pt2 <-  c(3,4)
# pt3 <-  c(5,6,7,8,9)
# means <-  c(mean(pt1), mean(pt2), mean(pt3))
# SDs <-  c(sd(pt1), sd(pt2), sd(pt3))
# ncounts <-  c(length(pt1), length(pt2), length(pt3))
# sd2 = composite_SD(means, SDs, ncounts)
# print(paste('sd2 =', sd2))
# #
# samples <- 0:8
# print(paste('avg =', mean(samples)))
# sd = sd(samples)
# print(paste('sd =', sd))
# pt1 = c(0,1,2)
# pt2 = c(3,4,5)
# pt3 = c(6,7,8)
# means = c(mean(pt1), mean(pt2), mean(pt3))
# SDs = c(sd(pt1), sd(pt2), sd(pt3))
# ncounts = 3
# sd2 = composite_SD(means, SDs, ncounts)
# print(paste('sd2 =', sd2))

      

