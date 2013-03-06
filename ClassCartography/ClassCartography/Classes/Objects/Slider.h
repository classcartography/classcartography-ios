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
    UIView *_viewToSlide;
    CGRect _visibleFrameOfViewToSlide;
}

- (id)initWithView:(UIView*)view;
- (void)slideToVisible:(BOOL)visible withAnimation:(BOOL)animated;

@end
