//
//  StudentGraphView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import <UIKit/UIKit.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "ShinobiChart+LineChart.h"
#import "SingleStudentData.h"

@interface StudentGraphView : UIView <SChartDelegate, SChartDatasource> {
    
    ShinobiChart *_chart;
    SingleStudentData *studentData;
    
    UILabel *graphTitle;
}

@end
