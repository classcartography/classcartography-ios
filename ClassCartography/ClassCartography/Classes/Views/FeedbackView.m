//
//  FeedbackView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "FeedbackView.h"

@implementation FeedbackView

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {

        feedbackData = [FeedbackData new];
        self.pieData = feedbackData;
        
        CGRect pieFrame;
        pieFrame = CGRectMake(0,30,300,270);
        pieChart = [ShinobiChart pieChartForOSDataWithFrame:pieFrame];
        pieChart.title = @"Did students understand Homework #7?";
        pieChart.licenseKey = SHINOBI_LICENSE;
        pieChart.datasource = self;
        pieChart.delegate = self;
        pieChart.backgroundColor = [UIColor clearColor];
        pieChart.plotAreaBackgroundColor = [UIColor clearColor];
        pieChart.plotAreaBorderColor = [UIColor clearColor];
        [self addSubview:pieChart];
        
        graphTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        graphTitle.text = @"Student Understanding";
        graphTitle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:graphTitle];
    }
    
    return self;
}

#pragma mark - ShinobiChart Datasource

- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 1;
}

- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    SChartPieSeries *series;
    series = [chart pieSeriesForOS];
    return series;
}

- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    int count;
    count = [feedbackData osTypes].count;
    return count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartRadialDataPoint *dp = [SChartRadialDataPoint new];
    dp.name = [[feedbackData osTypes] objectAtIndex:dataIndex];
    dp.value = [[feedbackData osData] objectForKey:dp.name];
    return dp;
}

- (int)selectedSliceIndex; {
    return [[feedbackData osTypes] indexOfObject:_selectedOS];
}

- (void)sChart:(ShinobiChart *)chart alterLabel:(UILabel *)label forDatapoint:(SChartRadialDataPoint *)datapoint atSliceIndex:(int)index inRadialSeries:(SChartRadialSeries *)series {

    label.adjustsFontSizeToFitWidth = YES;
    if (datapoint.value.floatValue < 5.f) {
        label.text = @"";
    }  else if (datapoint.value.floatValue < 15.f) {
        label.adjustsFontSizeToFitWidth = YES;
        CGRect f = label.frame;
        f.size.width = 35.f;
        label.frame = f;
    }
}

- (void)sChart:(ShinobiChart *)chart toggledSelectionForRadialPoint:(SChartRadialDataPoint *)dataPoint inSeries:(SChartRadialSeries *)series atPixelCoordinate:(CGPoint)pixelPoint {
}

- (void) sChartRenderStarted:(ShinobiChart *)chart withFullRedraw:(BOOL)fullRedraw {
}

- (void) sChartRenderFinished:(ShinobiChart *)chart {
}

- (void)initialSelectionForChart:(ShinobiChart*)chart {
    SChartPieSeries *ps = (SChartPieSeries*)[chart.allChartSeries lastObject];
    [ps setSlice:[self selectedSliceIndex] asSelected:YES];
    [chart redrawChartAndGL:YES];
}



@end
