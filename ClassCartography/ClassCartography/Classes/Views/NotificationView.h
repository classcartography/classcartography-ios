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
- (void)showStudentView;
@end

@interface NotificationView : UIView <UITableViewDataSource, UITableViewDelegate> {

    __unsafe_unretained id <NotificationViewDelegate> delegate;
    UILabel *title;
    
    UITableView *notificationTable;
    NSMutableArray *notifications;

}

@property (nonatomic, assign) id <NotificationViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame forDashboard:(NSString *)dashbooardType;
- (void) createStudentDummyData;

@end
