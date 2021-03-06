//
//  GraphView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import <UIKit/UIKit.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "ShinobiChart+LineChart.h"
#import "StudentData.h"
//#import "GraphData.h"


@interface GraphView : UIView <SChartDelegate, SChartDatasource> {

    ShinobiChart *_chart;
    StudentData *studentData;

    UILabel *graphTitle;
}
//@property (nonatomic) id<GraphData> graphData;
//@property (nonatomic) StudentData *studentData;

@end
