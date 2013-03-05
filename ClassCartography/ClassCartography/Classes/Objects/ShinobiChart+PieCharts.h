//
//  ShinobiChart+PieCharts.h
//  PieChart
//
//  Created by Stuart Grey on 21/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import <ShinobiCharts/ShinobiChart.h>

@interface ShinobiChart (PieCharts)

+ (ShinobiChart*)pieChartForOSDataWithFrame:(CGRect)frame;
- (SChartPieSeries*)pieSeriesForOS;

//+ (ShinobiChart*)donutChartForOSVersionDataWithFrame:(CGRect)frame;
//- (SChartDonutSeries*)donutSeriesForOSVerison;


@end
