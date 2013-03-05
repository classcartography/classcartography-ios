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
    
    _howLabel = [[UILabel alloc] initWithFrame:CGRectMake(350, 10, 700, 60)];
    _howLabel.backgroundColor = [UIColor clearColor];
    _howLabel.textColor = [UIColor blackColor];
    _howLabel.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:20];
    _howLabel.text = @"How is your 7th Grade English Class doing?";
    [self.view addSubview:_howLabel];
    
    _feedbackView = [[FeedbackView alloc] initWithFrame:CGRectMake(30, 391, 300, 350)];
    _feedbackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_feedbackView];
}

@end
