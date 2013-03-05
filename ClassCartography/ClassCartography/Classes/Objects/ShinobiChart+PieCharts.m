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
    theme.pieCrustThickness = 0;
    chart.theme = theme;
    
    chart.legend.hidden = YES;
    chart.legend.position = SChartLegendPositionBottomMiddle;
    chart.legend.maxSeriesPerLine = 1;
   
    return chart;
}

- (SChartPieSeries*)pieSeriesForOS {
    SChartPieSeries *p = [SChartPieSeries new];
    p.selectedStyle.protrusion = 30.f;
    p.style.showCrust = NO;
    p.style.chartEffect = SChartRadialChartEffectFlat;
    p.selectedStyle.chartEffect = SChartRadialChartEffectFlat;
    p.selectedStyle.showCrust = NO;
    p.labelFormatString = @"%.0f%%";
    p.selectedPosition = [NSNumber numberWithFloat:-M_PI/2.f];    
    p.style.crustColors = [NSMutableArray arrayWithObjects:[UIColor colorWithRed:0 green:170.0/255.0 blue:0 alpha:1.0],
                          [UIColor colorWithRed:170.0/255.0 green:0 blue:0 alpha:1.0],
                          [UIColor colorWithRed:0 green:0 blue:170.0/255.0 alpha:1.0], nil];
    p.style.flavourColors = [NSMutableArray arrayWithObjects:[UIColor colorWithRed:0 green:170.0/255.0 blue:0 alpha:1.0],
                           [UIColor colorWithRed:170.0/255.0 green:0 blue:0 alpha:1.0],
                           [UIColor colorWithRed:0 green:0 blue:170.0/255.0 alpha:1.0], nil];
    return p;
}


@end
