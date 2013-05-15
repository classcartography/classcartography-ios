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
        _chart.licenseKey = SHINOBI_LICENSE; 
        
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
