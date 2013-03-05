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
    if (self = [super init]) { }
    return self;
}

- (void)loadView {
    [super loadView];
    
    _feedbackView = [[FeedbackView alloc] initWithFrame:CGRectMake(30, 391, 300, 350)];
    _feedbackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_feedbackView];
}

@end
