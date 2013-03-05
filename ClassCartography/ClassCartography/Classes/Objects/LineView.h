@interface LineView : UIView {
    NSMutableArray *pointPairs;
}

- (void) addPointPair:(CGPoint)first second:(CGPoint)second;
- (void) reset;

@end