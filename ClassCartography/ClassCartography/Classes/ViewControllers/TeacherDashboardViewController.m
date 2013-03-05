//
//  TeacherDashboardViewController.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "TeacherDashboardViewController.h"


@implementation TeacherDashboardViewController

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}


- (void)loadView {
    [super loadView];
    
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor grayColor];
    
    _photoView = [[PhotoView alloc] initWithFrame:CGRectMake(32, 66, 251, 292)];
    _photoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_photoView];
    
    _graphView = [[GraphView alloc] initWithFrame:CGRectMake(319, 66, 676, 340)];
    _graphView.backgroundColor = [UIColor colorWithRed:251.0/255.0 green:251.0/255.0 blue:251.0/255.0 alpha:1.0];
    [self.view addSubview:_graphView];
    
    _feedbackView = [[FeedbackView alloc] initWithFrame:CGRectMake(32, 440, 300, 300)];
    _feedbackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_feedbackView];

    _commentView = [[CommentView alloc] initWithFrame:CGRectMake(363, 440, 300, 300)];
    _commentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_commentView];

    _notificationView = [[NotificationView alloc] initWithFrame:CGRectMake(695, 440, 300, 300)];
    _notificationView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_notificationView];

}

@end
