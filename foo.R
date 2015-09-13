#################################################
##
## foo.R: catchall calculations file
## 
## TODO: C & P contents into knitr source
##
#################################################

library( ggplot2 )

rawData <- read.csv( "activity.csv" )

plotTotalSteps <- function() {
        
    sumSteps <- aggregate( steps ~ date, data = rawData, FUN = sum )
    
    qplot( date, data = sumSteps, weight = steps, geom = "histogram" )
}
calculateMeanAndMedianSteps <- function() {
    
    print( mean( sumSteps$steps ) )
    print( median( sumSteps$steps ) )
}