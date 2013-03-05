//
//  CommentTableViewCell.m
//  ClassCartography
//
//  Created by Paul Lee on 3/5/13.
//
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.contentView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        photo = [[UIImageView alloc] initWithFrame:CGRectMake(4,8,40,60)];
        [self.contentView addSubview:photo];
        
        name = [[UILabel alloc] initWithFrame:CGRectMake(50, 8, 130, 16)];
        name.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12];
        name.textAlignment = NSTextAlignmentLeft;
        name.textColor = [UIColor blackColor];
        name.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:name];
        
        dateTime = [[UILabel alloc] initWithFrame:CGRectMake(180, 8, 120, 16)];
        dateTime.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10];
        dateTime.textAlignment = NSTextAlignmentRight;
        dateTime.textColor = [UIColor blackColor];
        dateTime.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:dateTime];
        
        assignment = [[UILabel alloc] initWithFrame:CGRectMake(50, 24, 250, 20)];
        assignment.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
        assignment.textAlignment = NSTextAlignmentLeft;
        assignment.textColor = [UIColor blackColor];
        assignment.backgroundColor = [UIColor clearColor];
        assignment.hidden = NO;
        [self.contentView addSubview:assignment];
        
        comment = [[UILabel alloc] initWithFrame:CGRectMake(50, 44, 250, 40)];
        comment.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12];
        comment.textAlignment = NSTextAlignmentLeft;
        comment.textColor = [UIColor blackColor];
        comment.backgroundColor = [UIColor clearColor];
        comment.hidden = NO;
        comment.numberOfLines = 2;
        [self.contentView addSubview:comment];
    }
    return self;
}


- (void)configureCell:(NSDictionary *)details forIndexPath:(NSIndexPath *)indexPath {
    dict = [NSDictionary dictionaryWithDictionary:details];
    photo.image = [UIImage imageNamed:[details objectForKey:@"imageName"]];
    name.text = [details objectForKey:@"name"];
    dateTime.text = [details objectForKey:@"dateTime"];
    assignment.text = [details objectForKey:@"assignment"];
    comment.text = [details objectForKey:@"comment"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
