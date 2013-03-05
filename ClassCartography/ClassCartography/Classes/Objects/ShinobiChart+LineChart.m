//
//  ShinobiChart+LineChart.m
//  LineChart

#import "ShinobiChart+LineChart.h"
#import "GraphData.h"

@implementation ShinobiChart (LineChart)

+ (ShinobiChart*)lineChartForBrowserUsageWithFrame:(CGRect)frame {
    
    BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    
    if (iPad) {
        frame.origin.x += 10;
        frame.origin.y += 50;
        frame.size.width -= 50;
        frame.size.height -= 100;
    } else {
        frame.size.width -= 10;
    }
    
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:frame];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    chart.clipsToBounds = NO;
    
    //Choose the light theme for this chart
    SChartLightTheme *theme = [SChartLightTheme new];
    //perform any theme stylign here before applying to the chart
    chart.theme = theme;
    
    //Double tap can either reset zoom or zoom in
    chart.gestureDoubleTapResetsZoom = YES;
    
    //Our xAxis is a category to take the discrete month data
    SChartCategoryAxis *xAxis = [SChartCategoryAxis new];
    xAxis.title = @"Month";
    xAxis.tickLabelClippingModeHigh = SChartTickLabelClippingModeTicksAndLabelsPersist; //keep tick marks at the right end
    //Make some space at the axis limits to prevent clipping of the datapoints
    xAxis.rangePaddingHigh = [NSNumber numberWithFloat:0.25f];
    xAxis.rangePaddingLow = [NSNumber numberWithFloat:0.25f];
    //allow zooming and panning
    xAxis.enableGesturePanning = YES;
    xAxis.enableGestureZooming = YES;
    xAxis.enableMomentumPanning = YES;
    xAxis.enableMomentumZooming = YES;
    chart.xAxis = xAxis;
    
    //Use a custom range to best display our data
    SChartNumberRange *r = [[SChartNumberRange alloc] initWithMinimum:[NSNumber numberWithInt:5] andMaximum:[NSNumber numberWithInt:28]];
    SChartNumberAxis *yAxis = [[SChartNumberAxis alloc] initWithRange:r];
    yAxis.enableGesturePanning = YES;
    yAxis.enableGestureZooming = YES;
    yAxis.enableMomentumPanning = YES;
    yAxis.enableMomentumZooming = YES;
    yAxis.title = @"Share (%)";
    yAxis.style.titleStyle.position = SChartTitlePositionBottomOrLeft;
    chart.yAxis = yAxis;
    
    //Only show the legend on the iPad
    chart.legend.hidden = !iPad;
    chart.legend.position = SChartLegendPositionBottomMiddle;
    chart.legend.maxSeriesPerLine = 6;
    
    return chart;
}

- (NSString*)seriesTitleForKey:(NSString*)key {
    NSString *title = nil;
    
    if ([key isEqualToString:attendance]) {
        title = @"Attendance";
    } else if ([key isEqualToString:grade]) {
        title = @"Grade";
    }
    
    return title;
}

- (SChartSeries*)lineSeriesForKey:(NSString*)key {
    
    SChartLineSeries *l = [SChartLineSeries new];
    l.style.pointStyle.showPoints = YES;
    l.title = [self seriesTitleForKey:key];
    return l;

}


@end
