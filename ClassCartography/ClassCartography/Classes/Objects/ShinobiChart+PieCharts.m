//
//  ShinobiChart+PieCharts.m
//  PieChart
//
//  Created by Stuart Grey on 21/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import "ShinobiChart+PieCharts.h"

@implementation ShinobiChart (PieCharts)

+ (ShinobiChart*)pieChartForOSDataWithFrame:(CGRect)frame {
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:frame];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
        
    SChartLightTheme *theme = [SChartLightTheme new];
    
    theme.chartTitleStyle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:12];
    theme.chartTitleStyle.position = SChartTitlePositionBottomOrLeft;
    theme.chartStyle.backgroundColor = [UIColor whiteColor];
    theme.chartStyle.backgroundColorGradient = [UIColor whiteColor];
    theme.legendStyle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:12];
    chart.theme = theme;
    
    chart.legend.hidden = YES;
    chart.legend.position = SChartLegendPositionBottomMiddle;
    chart.legend.maxSeriesPerLine = 1;
   
    return chart;
}

- (SChartPieSeries*)pieSeriesForOS {
    BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    SChartPieSeries *p = [SChartPieSeries new];
    p.selectedStyle.protrusion = iPad ? 40.f : 10.f;
    p.style.showCrust = NO;
    p.selectedStyle.showCrust = NO;
    p.labelFormatString = @"%.0f%%";
    p.selectedPosition = [NSNumber numberWithFloat:-M_PI/2.f];
    return p;
}

//+ (ShinobiChart*)donutChartForOSVersionDataWithFrame:(CGRect)frame {
//    
//    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:frame];
//    chart.autoresizingMask = ~UIViewAutoresizingNone;
//    
//    chart.theme = [SChartLightTheme new];
//    chart.legend.hidden = YES;
//    chart.legend.position = SChartLegendPositionBottomMiddle;
//    chart.legend.maxSeriesPerLine = 2;
//    
//    return chart;
//}
//
//
//- (SChartDonutSeries*)donutSeriesForOSVerison {
//    SChartDonutSeries *d = [SChartDonutSeries new];
//    d.style.showCrust = NO;
//    d.selectedStyle.showCrust = NO;
//    d.labelFormatString = @"%.0f%%";
//    d.style.labelFont = [UIFont fontWithName:self.theme.lightFontName size:12.f];
//    d.outerRadius = 105.f;
//    d.innerRadius = 35.f;
//    d.selectedStyle.protrusion = 0.f;
//    return d;
//}




@end
