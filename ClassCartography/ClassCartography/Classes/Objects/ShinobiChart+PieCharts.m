//
//  ShinobiChart+PieCharts.m
//  PieChart
//
//  Created by Stuart Grey on 21/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import "ShinobiChart+PieCharts.h"

#define POSITIVE [UIColor colorWithRed:20.0/255.0 green:215.0/255.0 blue:168.0/255.0 alpha:1.0]
#define NEGATIVE [UIColor colorWithRed:215.0/255.0 green:20.0/255.0 blue:68.0/255.0 alpha:1.0]
#define NEUTRAL [UIColor colorWithRed:20.0/255.0 green:68.0/255.0 blue:215.0/255.0 alpha:1.0]


@implementation ShinobiChart (PieCharts)

+ (ShinobiChart*)pieChartForOSDataWithFrame:(CGRect)frame {
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:frame];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
        
    SChartLightTheme *theme = [SChartLightTheme new];
    theme.chartTitleStyle.font = [UIFont fontWithName:@"QuicksandLight-Regular" size:12];
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
    p.style.labelFont = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
    p.selectedPosition = [NSNumber numberWithFloat:-M_PI/2.f];    
    p.style.crustColors = [NSMutableArray arrayWithObjects:POSITIVE, NEGATIVE, NEUTRAL, nil];
    p.style.flavourColors = [NSMutableArray arrayWithObjects:POSITIVE, NEGATIVE, NEUTRAL, nil];
    p.selectedStyle.crustColors = [NSMutableArray arrayWithObjects:POSITIVE, NEGATIVE, NEUTRAL, nil];
    p.selectedStyle.flavourColors = [NSMutableArray arrayWithObjects:POSITIVE, NEGATIVE, NEUTRAL, nil];
    return p;
}


@end
