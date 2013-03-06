//
//  Slider.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import "Slider.h"


@implementation Slider

- (id)initWithView:(UIView*)view {
	if (self = [super init]) {
		_viewToSlide = view;
		_visibleFrameOfViewToSlide = _viewToSlide.frame;
	}
	return self;
}

- (CGRect)frameWhenHidden {
	return CGRectMake(_visibleFrameOfViewToSlide.origin.x,_visibleFrameOfViewToSlide.origin.y,_visibleFrameOfViewToSlide.size.width,0);
}

- (void)slideToVisible:(BOOL)visible withAnimation:(BOOL)animated {
	if(animated) {
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
	}
	
	if(visible) {
		_viewToSlide.frame = _visibleFrameOfViewToSlide;
	} else {
		_viewToSlide.clipsToBounds = YES;
		_viewToSlide.frame = [self frameWhenHidden];
	}
	
	if(animated) { [UIView commitAnimations]; }
}

@end
