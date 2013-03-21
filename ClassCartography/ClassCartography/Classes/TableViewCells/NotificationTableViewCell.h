//
//  NotificationTableViewCell.h
//  ClassCartography
//
//  Created by Paul Lee on 3/5/13.
//
//

#import <UIKit/UIKit.h>
#import "Student.h"
@interface NotificationTableViewCell : UITableViewCell {

@private
    UILabel *message;
    UILabel *description;
    UILabel *dateTime;
    UIImageView *icon;
    NSMutableDictionary *dict;

}

- (void)configureCell:(Student *)student message:(NSString *)mess im:(NSString *)imgName forIndexPath:(NSIndexPath *)indexPath;
- (void)configureCell:(NSDictionary *)details forIndexPath:(NSIndexPath *)indexPath;

@end