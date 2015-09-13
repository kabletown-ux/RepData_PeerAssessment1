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

```r
sumSteps <- aggregate( steps ~ date, data = rawData, FUN = sum )
## TODO: fix date label crowding!
qplot( date, data = sumSteps, weight = steps, geom = "histogram" )
```

![](PA1_files/figure-html/unnamed-chunk-3-1.png) 

```r
mean( sumSteps$steps )
```

```
## [1] 10766.19
```

```r
median( sumSteps$steps )
```

```
## [1] 10765
```

## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
