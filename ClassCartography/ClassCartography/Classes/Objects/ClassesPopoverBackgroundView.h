//
//  ClassesPopoverBackgroundView.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/5/13.
//
//

#import <UIKit/UIKit.h>


@interface ClassesPopoverBackgroundView : UIPopoverBackgroundView

+(UIEdgeInsets)contentViewInsets;
+(CGFloat)arrowHeight;
+(CGFloat)arrowBase;

@property(nonatomic,readwrite) CGFloat arrowOffset;
@property(nonatomic,readwrite) UIPopoverArrowDirection arrowDirection;

@end
