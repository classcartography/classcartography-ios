//
//  TeacherDashboardViewController.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "DashboardViewController.h"
#import "PhotoView.h"
#import "GraphView.h"
#import "FeedbackView.h"
#import "CommentView.h"
#import "NotificationView.h"

@interface TeacherDashboardViewController : DashboardViewController {
    
@private
    IBOutlet PhotoView *photoView;
    IBOutlet GraphView *graphView;
    IBOutlet FeedbackView *feedbackView;
    IBOutlet CommentView *commentView;
    IBOutlet NotificationView *notificationView;
    

}


@end
