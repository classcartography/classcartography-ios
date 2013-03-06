//
//  Slider.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import <Foundation/Foundation.h>


@interface Slider : NSObject {
    
@private
    UIButton *_buttonToSlide;
    UIView *_viewToSlide;
    CGRect _visibleFrameOfButtonToSlide;
    CGRect _visibleFrameOfViewToSlide;
}

- (id)initWithButton:(UIButton *)button;
- (id)initWithView:(UIView *)view;
- (void)slideButtonToVisible:(BOOL)visible withAnimation:(BOOL)animated;
- (void)slideViewToVisible:(BOOL)visible withAnimation:(BOOL)animated;

@end
