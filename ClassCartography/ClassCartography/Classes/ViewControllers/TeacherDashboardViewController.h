//
//  TeacherDashboardViewController.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "DashboardViewController.h"
#import "FeedbackView.h"


@interface TeacherDashboardViewController : DashboardViewController {
    
@private
    UITapGestureRecognizer *_tap;
    UILabel *_howLabel;
    UIPopoverController *_classesPopoverController;
    FeedbackView *_feedbackView;
}

@end
