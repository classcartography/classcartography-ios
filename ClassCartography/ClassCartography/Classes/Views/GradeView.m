//
//  GradeView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/5/13.
//
//

#import "GradeView.h"

@implementation GradeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        title.text = @"Overall Grade";
        title.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:title];
        
        theGrade = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 300, 270)];
        theGrade.text = @"92";
        theGrade.textAlignment = NSTextAlignmentCenter;
        theGrade.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:130];
        [self addSubview:theGrade];
        
        
    }
    return self;
}

@end
