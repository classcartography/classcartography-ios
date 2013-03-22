//
//  NotificationView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import <UIKit/UIKit.h>
#import "NotificationTableViewCell.h"


@protocol NotificationViewDelegate
- (void)showStudentView:(Student *)student;
@end

@interface NotificationView : UIView <UITableViewDataSource, UITableViewDelegate> {

    __unsafe_unretained id <NotificationViewDelegate> delegate;
    
    NSMutableArray *notifications;
    UITableView *notificationTable;
    
@private
    BOOL _isStudent;
}

@property (nonatomic, assign) id <NotificationViewDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *notifications;
@property (nonatomic, retain) UITableView *notificationTable;

- (id)initWithFrame:(CGRect)frame forDashboard:(NSString *)dashboardType;

@end
