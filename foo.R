#################################################
##
## foo.R: catchall calculations file
## 
## TODO: C & P contents into knitr source
##
#################################################

library( ggplot2 )

debut <- TRUE
rawData <- read.csv( "activity.csv" )

plotTotalSteps <- function() {
        
    sumSteps <- aggregate( steps ~ date, data = rawData, FUN = sum )
    
    qplot( date, data = sumSteps, weight = steps, geom = "histogram" )
}
calculateMeanAndMedianSteps <- function() {
    
    print( mean( sumSteps$steps ) )
    print( median( sumSteps$steps ) )
}

calculateAvgStepsPerInterval <- function() {
  
    avgStepsByInterval <- aggregate( steps ~ interval, data = rawData, FUN = mean )
    ggplot( data = avgStepsByInterval, aes( x = interval, y = steps ) ) + geom_line() + xlab( "5 Minute Intervals" ) + ylab( "Average Steps Taken" )
}
calculateNumberOfNAs <- function() {
  nrow( rawData[ !complete.cases( rawData ), ] )
}

replaceNasWithMean <- function( steps, interval ) {
    
    tempValue <- NA
    
    if ( !is.na( steps ) ) {
        tempValue <- c( steps ) 
    } else {
        tempValue <- meanStepsByInterval[ meanStepsByInterval$interval == interval, "steps" ]
    }
    tempValue
}

meanStepsByInterval <- aggregate( steps ~ interval, data = rawData[ complete.cases( rawData ), ], FUN = mean )
updatedData <- rawData
updatedData$steps <- mapply( replaceNasWithMean, updatedData$steps, updatedData$interval )
