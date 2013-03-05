//
//  CommentTableViewCell.h
//  ClassCartography
//
//  Created by Paul Lee on 3/5/13.
//
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell {
    
@private
    UILabel *name;
    UILabel *dateTime;
    UILabel *assignment;
    UILabel *comment;
//    UILabel *weekAvailability;
    UIImageView *photo;
    UIImageView *stars;
    NSMutableDictionary *dict;
    
}

@property (nonatomic) UIImageView *stars;
@property (nonatomic) UILabel *comment;

- (void)configureCell:(NSDictionary *)details forIndexPath:(NSIndexPath *)indexPath;


@end
