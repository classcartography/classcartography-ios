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
        
        NSString *licenseKey = @"SaT4LeSLC2D5uL9MjAxMzA0MDNpbmZvQHNoaW5vYmljb250cm9scy5jb20=3lo58geh0gQoogPZ8PIH+Oqks9gBfDeXIeNwe3jFuNeXC4JMzuKGVs+oMGqQTg4DrY/+LYTAxnm4mdjgkh6WUyrePEWgVNXcL10hKIN/i/q3X2kiuapu7QDG1KXwgxPik7ZiVRZubSub3X47pomXyj5Qr7O0=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
        
        CGRect pieFrame;
        pieFrame = CGRectMake(0,20,300,280);
        pieChart = [ShinobiChart pieChartForOSDataWithFrame:pieFrame];
        pieChart.title = @"";
        pieChart.licenseKey = licenseKey;
        pieChart.datasource = self;
        pieChart.delegate = self;
        pieChart.backgroundColor = [UIColor clearColor];
        pieChart.plotAreaBackgroundColor = [UIColor clearColor];
        pieChart.plotAreaBorderColor = [UIColor clearColor];
        [self addSubview:pieChart];
        
        graphTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        graphTitle.text = @"Overall Student Feedback";
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
