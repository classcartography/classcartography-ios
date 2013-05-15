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
        _chart.licenseKey = SHINOBI_LICENSE; 
        studentData = [StudentData new];
//        self.graphData = studentData;
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
        return [chart lineSeriesForKey:@"Understanding"];
    } else {
        return [chart lineSeriesForKey:@"Grade"];
    }
}

- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    if (seriesIndex == 0) {
        DLOG(@"attendance count: %d", [[[studentData understandingData] allKeys] count]);
        return [[[studentData understandingData] allKeys] count];
    } else {
        DLOG(@"grade count: %d", [[[studentData gradeData] allKeys] count]);
        return [[[studentData gradeData] allKeys] count];
    }
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartDataPoint *dp = [SChartDataPoint new];

    if (seriesIndex == 0) {
        dp.xValue = [[studentData understandingDays] objectAtIndex:dataIndex];
        dp.yValue = [[studentData understandingData] objectForKey:dp.xValue];
    } else {
        dp.xValue = [[studentData gradeDays] objectAtIndex:dataIndex];
        dp.yValue = [[studentData gradeData] objectForKey:dp.xValue];
    }
    
    return dp;
}
//
//- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
//    return [studentData dataKeys].count;
//}
//
//- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
//    return [chart lineSeriesForKey:[[studentData dataKeys] objectAtIndex:index]];
//}
//
//- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
//    return [studentData months].count;
//}
//
//- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
//    SChartDataPoint *dp = [SChartDataPoint new];
//    
//    //Map our data values from the data to our chart
//    dp.xValue =  [[studentData months] objectAtIndex:[studentData months].count - dataIndex - 1];
//    dp.yValue = [[[studentData data] objectForKey:dp.xValue] objectForKey:[[studentData dataKeys] objectAtIndex:seriesIndex]];
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
