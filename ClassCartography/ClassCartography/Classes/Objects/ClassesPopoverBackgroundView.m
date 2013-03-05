//
//  ClassesPopoverBackgroundView.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/5/13.
//
//

#import "ClassesPopoverBackgroundView.h"


@implementation ClassesPopoverBackgroundView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _borderImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popover-bg"]];
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popover-arrow"]];
        self.backgroundColor =  _arrowView.backgroundColor =  _borderImageView.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_borderImageView];
        [self addSubview:_arrowView];
        
    }
    
    return self;
}

+(BOOL)wantsDefaultContentAppearance {
    return NO;
}

+(UIEdgeInsets)contentViewInsets{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

+(CGFloat)arrowHeight{
    return 20;
}

+(CGFloat)arrowBase{
    return 20;
}

- (CGFloat) arrowOffset {
    return _arrowOffset;
}

- (void) setArrowOffset:(CGFloat)arrowOffset {
    _arrowOffset = arrowOffset;
}

- (UIPopoverArrowDirection)arrowDirection {
    return _arrowDirection;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection {
    _arrowDirection = arrowDirection;
}

-  (void)layoutSubviews {
    if (self.arrowDirection == UIPopoverArrowDirectionUp)
    {
        NSLog(@"hey");
        CGFloat height = [[self class] arrowHeight];
        CGFloat base = [[self class] arrowBase];
        
        _borderImageView.frame = CGRectMake(0, height, self.frame.size.width, self.frame.size.height - height);
        
        _arrowView.frame = CGRectMake(self.frame.size.width * 0.5 + self.arrowOffset - base * 0.5, 1.0, base, height);
        [self bringSubviewToFront:_arrowView];
        
    }
} 

@end
