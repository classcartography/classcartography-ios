//
//  ShinobiChart+LineChart.h
//  LineChart

#import <ShinobiCharts/ShinobiChart.h>

@interface ShinobiChart (LineChart)

//Returns a new chart object that displays browser usage using line series types
+ (ShinobiChart*)lineChartForBrowserUsageWithFrame:(CGRect)frame;

//A line series styled and ready for the data source to link to
//the browser data
- (SChartSeries*)lineSeriesForKey:(NSString*)key;


@end
