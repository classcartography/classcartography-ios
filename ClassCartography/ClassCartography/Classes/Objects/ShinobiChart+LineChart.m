//
//  ShinobiChart+LineChart.m
//  LineChart

#import "ShinobiChart+LineChart.h"
#import "GraphData.h"

@implementation ShinobiChart (LineChart)

+ (ShinobiChart*)lineChartForBrowserUsageWithFrame:(CGRect)frame {
    
    BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:frame];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    chart.clipsToBounds = NO;
    
    SChartLightTheme *theme = [SChartLightTheme new];
    
    theme.chartTitleStyle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:12];
    theme.chartTitleStyle.position = SChartTitlePositionBottomOrLeft;
    theme.chartStyle.backgroundColor = [UIColor whiteColor];
    theme.chartStyle.backgroundColorGradient = [UIColor whiteColor];
    theme.yAxisStyle.titleStyle.position = SChartTitlePositionCenter;
    theme.yAxisStyle.titleStyle.font = [UIFont systemFontOfSize:12];
    theme.xAxisStyle.titleStyle.font = [UIFont systemFontOfSize:12];
    theme.xAxisStyle.titleStyle.position = SChartTitlePositionCenter;
    theme.yAxisStyle.majorTickStyle.labelFont = [UIFont systemFontOfSize:10];
    theme.yAxisStyle.minorTickStyle.labelFont = [UIFont systemFontOfSize:10];
    theme.xAxisStyle.majorTickStyle.labelFont = [UIFont systemFontOfSize:10];
    theme.xAxisStyle.minorTickStyle.labelFont = [UIFont systemFontOfSize:10];
    chart.theme = theme;
    //chart.theme.chartTitleStyle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:12];
    
    //Double tap can either reset zoom or zoom in
    chart.gestureDoubleTapResetsZoom = YES;
    
    //Our xAxis is a category to take the discrete month data

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [formatter dateFromString:@"2011-06-01"];
    NSDate *endDate = [formatter dateFromString:@"2012-01-01"];
    SChartDateRange *dr = [[SChartDateRange alloc] initWithDateMinimum:startDate andDateMaximum:endDate];
    SChartDateTimeAxis *xAxis = [[SChartDateTimeAxis alloc] initWithRange:dr];
    xAxis.title = @" ";
    xAxis.tickLabelClippingModeHigh = SChartTickLabelClippingModeTicksAndLabelsPersist; //keep tick marks at the right end
    xAxis.majorTickFrequency = [SChartDateFrequency dateFrequencyWithMonth:1];
    xAxis.minorTickFrequency = [SChartDateFrequency dateFrequencyWithDay:1];
    //Make some space at the axis limits to prevent clipping of the datapoints
    xAxis.rangePaddingHigh = [SChartDateFrequency dateFrequencyWithMonth:1]; //[NSNumber numberWithFloat:0.25f];
    xAxis.rangePaddingLow =  [SChartDateFrequency dateFrequencyWithDay:1]; //[NSNumber numberWithFloat:0.25f];
    //allow zooming and panning
    xAxis.enableGesturePanning = YES;
    xAxis.enableGestureZooming = YES;
    xAxis.enableMomentumPanning = YES;
    xAxis.enableMomentumZooming = YES;
    chart.xAxis = xAxis;
    
    //Use a custom range to best display our data
    SChartNumberRange *r = [[SChartNumberRange alloc] initWithMinimum:[NSNumber numberWithInt:0] andMaximum:[NSNumber numberWithInt:100]];
    SChartNumberAxis *yAxis = [[SChartNumberAxis alloc] initWithRange:r];
    yAxis.enableGesturePanning = NO;
    yAxis.enableGestureZooming = NO;
    yAxis.enableMomentumPanning = NO;
    yAxis.enableMomentumZooming = NO;
    yAxis.title = @"Percentage (%)";

    chart.yAxis = yAxis;
    
    //Only show the legend on the iPad
    chart.legend.hidden = NO;
    chart.legend.position = SChartLegendPositionBottomMiddle;
    chart.legend.maxSeriesPerLine = 2;
    chart.legend.style.font = [UIFont systemFontOfSize:10];
    chart.legend.style.marginWidth = [NSNumber numberWithFloat:0.55f];
    chart.legend.backgroundColor = [UIColor whiteColor];
    chart.legend.cornerRadius = [NSNumber numberWithInt:10];
    
    return chart;
}

- (SChartSeries*)lineSeriesForKey:(NSString*)key {
    
    SChartLineSeries *l = [SChartLineSeries new];
    l.style.pointStyle.showPoints = NO;
    l.title = key;
    return l;

}


@end
