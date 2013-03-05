//
//  GraphView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "GraphView.h"
#import "ShinobiChart+LineChart.h"

@implementation GraphView

- (id)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        _chart = [ShinobiChart lineChartForBrowserUsageWithFrame:self.bounds];
        _chart.title = @"";
        _chart.licenseKey = @"SaT4LeSLC2D5uL9MjAxMzA0MDNpbmZvQHNoaW5vYmljb250cm9scy5jb20=3lo58geh0gQoogPZ8PIH+Oqks9gBfDeXIeNwe3jFuNeXC4JMzuKGVs+oMGqQTg4DrY/+LYTAxnm4mdjgkh6WUyrePEWgVNXcL10hKIN/i/q3X2kiuapu7QDG1KXwgxPik7ZiVRZubSub3X47pomXyj5Qr7O0=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";

        studentData = [StudentData new];
        self.graphData = studentData;
        _chart.datasource = self;
        _chart.delegate = self;
        [self addSubview:_chart];
        
        graphTitle = [[UILabel alloc] initWithFrame:CGRectMake(54, -20, 400, 20)];
        graphTitle.text = @"Overall Class Performance";
        graphTitle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:graphTitle];
    }
    
    return self;
}

#pragma mark - ShinobiChart Datasource


- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 2;
}

- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    if (index == 0) {
        return [chart lineSeriesForKey:@"Attendance"];
    } else {
        return [chart lineSeriesForKey:@"Grade"];
    }
}

- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    if (seriesIndex == 0) {
        NSLog(@"attendance count: %d", [[[_graphData attendanceData] allKeys] count]);
        return [[[_graphData attendanceData] allKeys] count];
    } else {
        NSLog(@"grade count: %d", [[[_graphData gradeData] allKeys] count]);
        return [[[_graphData gradeData] allKeys] count];
    }
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartDataPoint *dp = [SChartDataPoint new];

    if (seriesIndex == 0) {
        NSLog(@"Data index: %d", dataIndex);
        dp.xValue = [[_graphData attendanceDays] objectAtIndex:dataIndex];
        NSLog(@"dx value: %@", dp.xValue);
        dp.yValue = [[_graphData attendanceData] objectForKey:dp.xValue];
        NSLog(@"dy value: %@", dp.yValue);
    } else {
        NSLog(@"Data index: %d", dataIndex);
        dp.xValue = [[_graphData gradeDays] objectAtIndex:dataIndex];
        dp.yValue = [[_graphData gradeData] objectForKey:dp.xValue];
    }
    
    return dp;
}
//
//- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
//    return [_graphData dataKeys].count;
//}
//
//- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
//    return [chart lineSeriesForKey:[[_graphData dataKeys] objectAtIndex:index]];
//}
//
//- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
//    return [_graphData months].count;
//}
//
//- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
//    SChartDataPoint *dp = [SChartDataPoint new];
//    
//    //Map our data values from the data to our chart
//    dp.xValue =  [[_graphData months] objectAtIndex:[_graphData months].count - dataIndex - 1];
//    dp.yValue = [[[_graphData data] objectForKey:dp.xValue] objectForKey:[[_graphData dataKeys] objectAtIndex:seriesIndex]];
//    
//    return dp;
//}

#pragma mark - ShinobiChart Delegate
- (void)sChart:(ShinobiChart *)chart alterTickMark:(SChartTickMark *)tickMark beforeAddingToAxis:(SChartAxis *)axis {
    //remove some of the tickmarks in portrait
    if ([axis isXAxis]) {
        
        BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        if (!iPad || UIInterfaceOrientationIsPortrait([[UIDevice currentDevice] orientation])) {
            
            //xAxis is a category, each tick value is 1,2,3,4,.. etc
            //a mod 2 operation will give us every other xValue
            if ((int)tickMark.value%2) {
                tickMark.tickLabel.text = @"";
            }
        }
    }
}

@end
