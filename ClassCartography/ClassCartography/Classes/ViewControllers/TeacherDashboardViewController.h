//
//  TeacherDashboardViewController.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "DashboardViewController.h"
#import "FeedbackView.h"
#import "GraphView.h"

@interface TeacherDashboardViewController : DashboardViewController <UITableViewDataSource, PhotoViewDelegate> {
    
@private
    UITapGestureRecognizer *_tap;
    UILabel *_howLabel;
    UIPopoverController *_sectionsPopoverController;
    FeedbackView *_feedbackView;
    GraphView *graphView;
}

@end
