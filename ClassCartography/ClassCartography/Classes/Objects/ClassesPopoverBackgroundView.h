//
//  ClassesPopoverBackgroundView.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/5/13.
//
//

#import <UIKit/UIKit.h>


@interface ClassesPopoverBackgroundView : UIPopoverBackgroundView {
    
@private
    UIImageView *_borderImageView;
    UIImageView *_arrowView;
    CGFloat _arrowOffset;
    UIPopoverArrowDirection _arrowDirection;
}

    +(UIEdgeInsets)contentViewInsets;
    +(CGFloat)arrowHeight;
    +(CGFloat)arrowBase;
    
    @property(nonatomic,readwrite) CGFloat arrowOffset;
    @property(nonatomic,readwrite) UIPopoverArrowDirection arrowDirection;

@end
