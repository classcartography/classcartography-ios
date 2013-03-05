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
    UILabel *_howLabel;
    FeedbackView *_feedbackView;
}

@end
