//
//  Datasource.h
//  LineChart

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "GraphData.h"

@interface Datasource : NSObject <SChartDatasource>

@property (nonatomic) id<GraphData> graphData;

@end
