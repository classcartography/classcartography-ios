//
//  FeedbackView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import <UIKit/UIKit.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "ShinobiChart+PieCharts.h"
#import "PieData.h"
#import "FeedbackData.h"

@interface FeedbackView : UIView <SChartDatasource, SChartDelegate> {

    ShinobiChart *pieChart;
    FeedbackData *feedbackData;
    UILabel *selectedOSLabel;
    BOOL first;
    UILabel *graphTitle;

}

@property (nonatomic) id <PieData> pieData;

@property (nonatomic) NSString *selectedOS;

- (int)selectedSliceIndex;

@end
