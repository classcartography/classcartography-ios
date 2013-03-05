//
//  PhotoView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import <UIKit/UIKit.h>

@protocol PhotoViewDelegate
- (void)showStudentView;
@end


@interface PhotoView : UIView {
    
    __unsafe_unretained id <PhotoViewDelegate> delegate;
    UIButton *button;
}

@property (nonatomic, assign) id <PhotoViewDelegate> delegate;

@end
