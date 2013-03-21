//
//  InterventionTableViewCell.m
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import "InterventionTableViewCell.h"

@implementation InterventionTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleGray;

        dateTime = [[UILabel alloc] initWithFrame:CGRectMake(150, 8, 150, 16)];
        dateTime.font = [UIFont fontWithName:@"QuicksandLight-Regular" size:10];
        dateTime.textAlignment = NSTextAlignmentRight;
        dateTime.textColor = [UIColor blackColor];
        dateTime.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:dateTime];
        
        message = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, 140, 20)];
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
    message.text = [details objectForKey:@"message"];
    dateTime.text = [details objectForKey:@"dateTime"];
    description.text = [details objectForKey:@"description"];
    CGSize descriptionMaximumSize = CGSizeMake(280, 44);
    CGSize descriptionStringSize = [description.text sizeWithFont:description.font
                                                constrainedToSize:descriptionMaximumSize
                                                    lineBreakMode:description.lineBreakMode];
    description.frame = CGRectMake(0, 36, 280, descriptionStringSize.height);
    [description sizeToFit];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
