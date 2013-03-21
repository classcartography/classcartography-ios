//
//  InterventionTableViewCell.h
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import <UIKit/UIKit.h>

@interface InterventionTableViewCell : UITableViewCell {
    UILabel *message;
    UILabel *dateTime;
    UILabel *description;
    NSMutableDictionary *dict;

}

- (void)configureCell:(NSDictionary *)details forIndexPath:(NSIndexPath *)indexPath;

@end
