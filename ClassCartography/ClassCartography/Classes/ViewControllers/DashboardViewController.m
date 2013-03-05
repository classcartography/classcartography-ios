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
    
    helloLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 320, 60)];
    helloLabel.backgroundColor = [UIColor clearColor];
    helloLabel.textColor = [UIColor blackColor];
    helloLabel.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:20];
    [self.view addSubview:helloLabel];
    
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"EEEEdMMMMYYYY" options:0
                                                              locale:[NSLocale currentLocale]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(32, 34, 400, 60)];
    dateLabel.backgroundColor = [UIColor clearColor];
    dateLabel.textColor = [UIColor blackColor];
    dateLabel.font = [UIFont fontWithName:@"QuicksandLight-Regular" size:14];
    dateLabel.text = [dateFormatter stringFromDate:[NSDate date]];
    [self.view addSubview:dateLabel];
    
    photoView = [[PhotoView alloc] initWithFrame:CGRectMake(32, 88, 275, 275)];
    photoView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:photoView];
    
    graphView = [[GraphView alloc] initWithFrame:CGRectMake(320, 85, 670, 290)];
    graphView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:graphView];
    
    commentView = [[CommentView alloc] initWithFrame:CGRectMake(690, 391, 300, 300)];
    commentView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:commentView];
    
    notificationView = [[NotificationView alloc] initWithFrame:CGRectMake(360, 391, 300, 300)];
    notificationView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:notificationView];
}


#pragma mark
#pragma mark InBloomAPIHandlerDelegate methods
// Implement these methods in the subclass of DashboardViewController

- (void)loginComplete { }

- (void)getClassesComplete { }

@end
