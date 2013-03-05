//
//  Datasource.m
//  LineChart

#import "Datasource.h"
#import "ShinobiChart+LineChart.h"

@implementation Datasource

- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return [_graphData dataKeys].count;
}

- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    return [chart lineSeriesForKey:[[_graphData dataKeys] objectAtIndex:index]];
}

- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    return [_graphData months].count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartDataPoint *dp = [SChartDataPoint new];
    
    //Map our data values from the data to our chart
    dp.xValue =  [[_graphData months] objectAtIndex:[_graphData months].count - dataIndex - 1];
    dp.yValue = [[[_graphData data] objectForKey:dp.xValue] objectForKey:[[_graphData dataKeys] objectAtIndex:seriesIndex]];
    
    return dp;
}


@end
