//
//  NotificationView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import <UIKit/UIKit.h>
#import "NotificationTableViewCell.h"

@interface NotificationView : UIView <UITableViewDataSource, UITableViewDelegate> {
    UILabel *title;
    
    UITableView *notificationTable;
    NSMutableArray *notifications;

}


@end
