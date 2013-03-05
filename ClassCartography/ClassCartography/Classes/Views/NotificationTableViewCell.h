//
//  NotificationTableViewCell.h
//  ClassCartography
//
//  Created by Paul Lee on 3/5/13.
//
//

#import <UIKit/UIKit.h>

@interface NotificationTableViewCell : UITableViewCell {

@private
    UILabel *message;
    UILabel *description;
    UILabel *dateTime;
    UIImageView *icon;
    NSMutableDictionary *dict;

}

- (void)configureCell:(NSDictionary *)details forIndexPath:(NSIndexPath *)indexPath;

@end