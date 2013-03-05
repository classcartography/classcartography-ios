//
//  GraphView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import <UIKit/UIKit.h>
#import <ShinobiCharts/ShinobiChart.h>


@interface GraphView : UIView <SChartDelegate, SChartDatasource> {

 ShinobiChart *_chart;
}

@end
