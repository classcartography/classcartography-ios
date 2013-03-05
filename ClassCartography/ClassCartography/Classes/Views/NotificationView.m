//
//  NotificationView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "NotificationView.h"

@implementation NotificationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        graphTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        graphTitle.text = @"Notifications";
        graphTitle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:graphTitle];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
