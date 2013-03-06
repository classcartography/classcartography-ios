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
    theme.chartTitleStyle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:14];
    theme.chartTitleStyle.position = SChartTitlePositionBottomOrLeft;
    theme.chartStyle.backgroundColor = [UIColor whiteColor];
    theme.chartStyle.backgroundColorGradient = [UIColor whiteColor];
    theme.legendStyle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:12];
    theme.pieCrustThickness = 0;
    chart.theme = theme;
    
    chart.legend.hidden = NO;
    chart.legend.position = SChartLegendPositionBottomMiddle;
    chart.legend.maxSeriesPerLine = 2;
    chart.legend.style.font = [UIFont systemFontOfSize:10];
    chart.legend.style.marginWidth = [NSNumber numberWithFloat:0.55f];
    chart.legend.style.areaColor = [UIColor clearColor];
    chart.legend.cornerRadius = [NSNumber numberWithInt:10];
   
    return chart;
}

- (SChartPieSeries*)pieSeriesForOS {
    SChartPieSeries *p = [SChartPieSeries new];
    p.selectedStyle.protrusion = 10.f;
    p.style.showCrust = NO;
    p.style.chartEffect = SChartRadialChartEffectFlat;
    p.selectedStyle.chartEffect = SChartRadialChartEffectFlat;
    p.selectedStyle.showCrust = NO;
    p.labelFormatString = @"%.0f%%";
    p.style.labelFont = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
    p.selectedPosition = [NSNumber numberWithFloat:-M_PI/2.f];    
    p.style.crustColors = [NSMutableArray arrayWithObjects:POSITIVE, NEGATIVE, nil];
    p.style.flavourColors = [NSMutableArray arrayWithObjects:POSITIVE, NEGATIVE, nil];
    p.selectedStyle.crustColors = [NSMutableArray arrayWithObjects:POSITIVE, NEGATIVE, nil];
    p.selectedStyle.flavourColors = [NSMutableArray arrayWithObjects:POSITIVE, NEGATIVE, nil];
    return p;
}


@end
