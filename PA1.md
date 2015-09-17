# Reproducible Research: Peer Assessment 1
## Libraries

```r
library( ggplot2 )
```

## Loading and preprocessing the data

```r
rawData <- read.csv( "activity.csv" )
```


## What is mean total number of steps taken per day?
# ```{r}
# sumSteps <- aggregate( steps ~ date, data = rawData, FUN = sum )
# ## TODO: fix date label crowding!
# qplot( date, data = sumSteps, weight = steps, geom = "histogram" )
# 
# mean( sumSteps$steps )
# median( sumSteps$steps )
# ```

## What is the average daily activity pattern?
# ```{r}
# avgStepsByInterval <- aggregate( steps ~ interval, data = rawData, FUN = mean )
# ggplot( data = avgStepsByInterval, aes( x = interval, y = steps ) ) + geom_line() + xlab( "5 Minute Intervals" ) + ylab( "Average Steps Taken" )
# 
# ## TODO: reformat intervals as times?
# ```

## Imputing missing values
1) Number of rows with NA values

```r
nrow( rawData[ !complete.cases( rawData ), ] )
```

```
## [1] 2304
```
2) I'm going to replace NAs with mean of interval

3) Create dataset with NAs replaced by mean of interval

```r
## could do this, but how to assign values?
##aggregate( steps ~ interval, data = rawData[ complete.cases( rawData ), ], FUN = mean )
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
```

4) Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?

## Are there differences in activity patterns between weekdays and weekends?
