//
//  DashboardViewController.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "DashboardViewController.h"
#import "UserHandler.h"


@implementation DashboardViewController

- (id)init {
    if (self = [super init]) { }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _helloLabel = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, 700, 60)];
    _helloLabel.backgroundColor = [UIColor clearColor];
    _helloLabel.textColor = [UIColor blackColor];
    _helloLabel.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:24];
    [self.view addSubview:_helloLabel];
    
    photoView = [[PhotoView alloc] initWithFrame:CGRectMake(32, 66, 251, 292)];
    photoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:photoView];
    
    graphView = [[GraphView alloc] initWithFrame:CGRectMake(319, 66, 676, 285)];
    graphView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:graphView];
    
    commentView = [[CommentView alloc] initWithFrame:CGRectMake(363, 391, 300, 350)];
    commentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:commentView];
    
    notificationView = [[NotificationView alloc] initWithFrame:CGRectMake(695, 391, 300, 350)];
    notificationView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:notificationView];
}


#pragma mark
#pragma mark InBloomAPIHandlerDelegate methods

- (void)loginComplete {
    _helloLabel.text = [NSString stringWithFormat:@"Hello, %@", [UserHandler sharedUserHandler].name];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
