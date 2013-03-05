#import "LineView.h"

@implementation LineView

- (void) reset {
    [pointPairs removeAllObjects];
}

- (void) drawRect:(CGRect)rect {
    // draw lines
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(c, [[UIColor lightGrayColor] CGColor]);
    CGContextSetLineWidth(c, 1.f);
    
    for(NSArray *pair in pointPairs){
        CGPoint first, second;

        [(NSValue *)[pair objectAtIndex:0] getValue:&first];
        [(NSValue *)[pair objectAtIndex:1] getValue:&second];
        
        CGContextBeginPath(c);
        
        CGContextMoveToPoint(c, first.x, first.y);
        CGContextAddLineToPoint(c, second.x, second.y);
        
        CGContextStrokePath(c);
        
        CGContextAddEllipseInRect(c, CGRectMake(first.x-2, first.y-2, 4, 4));
        CGContextAddEllipseInRect(c, CGRectMake(second.x-2, second.y-2, 4, 4));
        
        CGContextSetFillColorWithColor(c, [UIColor lightGrayColor].CGColor);
        CGContextFillPath(c);
        
        
    }
}

- (void) addPointPair:(CGPoint)first second:(CGPoint)second {
    if(pointPairs == nil)
        pointPairs = [[NSMutableArray alloc] init];
    
    NSValue *firstValue, *secondValue;
    NSArray *pair;
    
    firstValue  = [NSValue valueWithCGPoint:first];
    secondValue = [NSValue valueWithCGPoint:second];
    
    pair = [NSArray arrayWithObjects:firstValue, secondValue, nil];
    
    [pointPairs addObject:pair];
    
    [self setNeedsDisplay];
}

@end