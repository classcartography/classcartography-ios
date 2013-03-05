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
        icon = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,30,60)];
        [self.contentView addSubview:icon];

//        dateTime = [[UILabel alloc] initWithFrame:CGRectMake(180, 8, 120, 16)];
        dateTime = [[UILabel alloc] initWithFrame:CGRectMake(300, 8, 20, 16)];
        dateTime.font = [UIFont fontWithName:@"QuicksandLight-Regular" size:10];
        dateTime.textAlignment = NSTextAlignmentRight;
        dateTime.textColor = [UIColor blackColor];
        dateTime.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:dateTime];

//        message = [[UILabel alloc] initWithFrame:CGRectMake(40, 8, 260, 20)];
        message = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        message.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:14];
        message.textAlignment = NSTextAlignmentLeft;
        message.textColor = [UIColor blackColor];
        message.backgroundColor = [UIColor clearColor];
        message.hidden = NO;
        [self.contentView addSubview:message];
        
        description = [[UILabel alloc] init];
        description.backgroundColor = [UIColor clearColor];
        description.lineBreakMode = UILineBreakModeWordWrap;
        description.numberOfLines = 0;
        description.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:12];
        [self.contentView addSubview:description];
        
    }
    return self;
}


- (void)configureCell:(NSDictionary *)details forIndexPath:(NSIndexPath *)indexPath {
    dict = [NSDictionary dictionaryWithDictionary:details];
    icon.image = [UIImage imageNamed:[details objectForKey:@"imageName"]];
    message.text = [details objectForKey:@"message"];
    dateTime.text = [details objectForKey:@"dateTime"];
    description.text = [details objectForKey:@"description"];
    CGSize descriptionMaximumSize = CGSizeMake(260, 50);
    CGSize descriptionStringSize = [description.text sizeWithFont:description.font
                                                constrainedToSize:descriptionMaximumSize
                                                    lineBreakMode:description.lineBreakMode];
    description.frame = CGRectMake(40, 8, 260, descriptionStringSize.height);
    [description sizeToFit];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
