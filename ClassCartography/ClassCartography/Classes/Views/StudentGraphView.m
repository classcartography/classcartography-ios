//
//  StudentGraphView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import "StudentGraphView.h"
#import <ShinobiCharts/ShinobiChart.h>
#import "ShinobiChart+LineChart.h"
#import "SingleStudentData.h"

@implementation StudentGraphView

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        _chart = [ShinobiChart lineChartForBrowserUsageWithFrame:self.bounds];
        _chart.title = @"";
        _chart.licenseKey = @"SaT4LeSLC2D5uL9MjAxMzA0MDNpbmZvQHNoaW5vYmljb250cm9scy5jb20=3lo58geh0gQoogPZ8PIH+Oqks9gBfDeXIeNwe3jFuNeXC4JMzuKGVs+oMGqQTg4DrY/+LYTAxnm4mdjgkh6WUyrePEWgVNXcL10hKIN/i/q3X2kiuapu7QDG1KXwgxPik7ZiVRZubSub3X47pomXyj5Qr7O0=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
        
        studentData = [SingleStudentData new];
        _chart.datasource = self;
        _chart.delegate = self;
        _chart.backgroundColor = [UIColor clearColor];
        _chart.plotAreaBackgroundColor = [UIColor clearColor];
        _chart.plotAreaBorderColor = [UIColor clearColor];
        [self addSubview:_chart];
    }
    
    return self;
}

#pragma mark - ShinobiChart Datasource


- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 2;
}

- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    if (index == 0) {
        return [chart lineSeriesForKey:@"Grade"];
    } else {
        SChartScatterSeries *s = (SChartScatterSeries *)[chart scatterSeriesForKey:@"Interventions"];
//        if (index == 0) {
//            s.style.pointStyle.texture = [UIImage imageNamed:@"intervention1"];
//        } else if (index == 1) {
//            s.style.pointStyle.texture = [UIImage imageNamed:@"intervention2"];
//        } else if (index == 2) {
//            s.style.pointStyle.texture = [UIImage imageNamed:@"intervention3"];
//        }
        
        return s;
    }
}

- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    if (seriesIndex == 0) {
        return [[[studentData gradeData] allKeys] count];
    } else {
        return [[[studentData interventionData] allKeys] count];
    }
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartDataPoint *dp = [SChartDataPoint new];

    if (seriesIndex == 0) {
        dp.xValue = [[studentData gradeDays] objectAtIndex:dataIndex];
        dp.yValue = [[studentData gradeData] objectForKey:dp.xValue];
    } else {
//        NSLog(@"Data index: %d", dataIndex);
//        NSString *interventionKey = [[studentData interventionDays] objectAtIndex:dataIndex];
//        NSLog(@"dx value: %@", interventionKey);
//        NSNumber *interventionValue = [[studentData interventionData] objectForKey:interventionKey];
//        NSLog(@"dy value: %@", interventionValue);
//        if (interventionValue != nil) {
//            dp.xValue = [[studentData interventionDays] objectAtIndex:dataIndex];
//            dp.yValue = [[studentData interventionData] objectForKey:dp.xValue];
//        }
        dp.xValue = [[studentData interventionDays] objectAtIndex:dataIndex];
        dp.yValue = [[studentData interventionData] objectForKey:dp.xValue];
    }
    
    return dp;
}


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
