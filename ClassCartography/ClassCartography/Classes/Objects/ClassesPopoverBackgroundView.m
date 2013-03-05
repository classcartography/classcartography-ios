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
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

+(BOOL)wantsDefaultContentAppearance {
    return NO;
}

+(UIEdgeInsets)contentViewInsets{
    return UIEdgeInsetsMake(2, 2, 2, 2);
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
    [super layoutSubviews];
    
    CGFloat _height = self.frame.size.height;
    CGFloat _width = self.frame.size.width;
    CGFloat _left = 0.0;
    CGFloat _top = 0.0;
    CGFloat _coordinate = 0.0;
    CGAffineTransform _rotation = CGAffineTransformIdentity;
    
    
    switch (self.arrowDirection) {
        case UIPopoverArrowDirectionUp:
            _top += 25;
            _height -= 25;
            _coordinate = ((self.frame.size.width / 2) + self.arrowOffset) - (25/2);
            _arrowView.frame = CGRectMake(_coordinate, 0, 25, 25);
            break;
            
            
        case UIPopoverArrowDirectionDown:
            _height -= 25;
            _coordinate = ((self.frame.size.width / 2) + self.arrowOffset) - (25/2);
            _arrowView.frame = CGRectMake(_coordinate, _height, 25, 25);
            _rotation = CGAffineTransformMakeRotation( M_PI );
            break;
            
        case UIPopoverArrowDirectionLeft:
            _left += 25;
            _width -= 25;
            _coordinate = ((self.frame.size.height / 2) + self.arrowOffset) - (25/2);
            _arrowView.frame = CGRectMake(0, _coordinate, 25, 25);
            _rotation = CGAffineTransformMakeRotation( -M_PI_2 );
            break;
            
        case UIPopoverArrowDirectionRight:
            _width -= 25;
            _coordinate = ((self.frame.size.height / 2) + self.arrowOffset)- (25/2);
            _arrowView.frame = CGRectMake(_width, _coordinate, 25, 25);
            _rotation = CGAffineTransformMakeRotation( M_PI_2 );
            
            break;
            
    }
}

@end
