//
//  NotificationTableViewCell.m
//  ClassCartography
//
//  Created by Paul Lee on 3/5/13.
//
//

#import "NotificationTableViewCell.h"

@implementation NotificationTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        icon = [[UIImageView alloc] initWithFrame:CGRectMake(4,8,60,60)];
        [self.contentView addSubview:icon];
        
        message = [[UILabel alloc] initWithFrame:CGRectMake(70, 8, 230, 20)];
        message.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:14];
        message.textAlignment = NSTextAlignmentLeft;
        message.textColor = [UIColor blackColor];
        message.backgroundColor = [UIColor clearColor];
        message.hidden = NO;
        [self.contentView addSubview:message];
        
        description = [[UILabel alloc] initWithFrame:CGRectMake(70, 28, 250, 24)];
        description.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:12];
        description.textAlignment = NSTextAlignmentLeft;
        description.textColor = [UIColor blackColor];
        description.backgroundColor = [UIColor clearColor];
        description.hidden = NO;
        description.numberOfLines = 3;
        [self.contentView addSubview:description];
    }
    return self;
}


- (void)configureCell:(NSDictionary *)details forIndexPath:(NSIndexPath *)indexPath {
    dict = [NSDictionary dictionaryWithDictionary:details];
    icon.image = [UIImage imageNamed:[details objectForKey:@"imageName"]];
    message.text = [details objectForKey:@"message"];
    description.text = [details objectForKey:@"description"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
