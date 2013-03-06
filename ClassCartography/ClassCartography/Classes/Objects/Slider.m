//
//  Slider.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import "Slider.h"


@implementation Slider

- (id)initWithButton:(UIButton *)button {
    if (self = [super init]) {
		_buttonToSlide = button;
		_visibleFrameOfButtonToSlide = _buttonToSlide.frame;
	}
	return self;
}

- (id)initWithView:(UIView *)view {
	if (self = [super init]) {
		_viewToSlide = view;
		_visibleFrameOfViewToSlide = _viewToSlide.frame;
	}
	return self;
}

- (CGRect)buttonFrameWhenVisible { //hard-coded, bad i know... 
    return CGRectMake(_visibleFrameOfButtonToSlide.origin.x-220, _visibleFrameOfButtonToSlide.origin.y, _visibleFrameOfButtonToSlide.size.width, _visibleFrameOfButtonToSlide.size.height);
}

- (CGRect)viewFrameWhenHidden {
	return CGRectMake(_visibleFrameOfViewToSlide.origin.x+_visibleFrameOfViewToSlide.size.width, _visibleFrameOfViewToSlide.origin.y, _visibleFrameOfViewToSlide.size.width, _visibleFrameOfViewToSlide.size.height);
}

- (void)slideButtonToVisible:(BOOL)visible withAnimation:(BOOL)animated {
	if(animated) {
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.5];
	}
	
	if(visible) {
        _buttonToSlide.clipsToBounds = YES;
        _buttonToSlide.frame = [self buttonFrameWhenVisible];
	} else {
        _buttonToSlide.frame = _visibleFrameOfButtonToSlide;
	}
	
	if(animated) { [UIView commitAnimations]; }
}

- (void)slideViewToVisible:(BOOL)visible withAnimation:(BOOL)animated {
	if(animated) {
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.5];
	}
	
	if(visible) {
		_viewToSlide.frame = _visibleFrameOfViewToSlide;
	} else {
		_viewToSlide.clipsToBounds = YES;
		_viewToSlide.frame = [self viewFrameWhenHidden];
	}
	
	if(animated) { [UIView commitAnimations]; }
}

@end
