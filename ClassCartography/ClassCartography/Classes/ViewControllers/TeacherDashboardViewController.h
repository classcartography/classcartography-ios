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
    PhotoView *_photoView;
    GraphView *_graphView;
    FeedbackView *_feedbackView;
    CommentView *_commentView;
    NotificationView *_notificationView;
}

@end
