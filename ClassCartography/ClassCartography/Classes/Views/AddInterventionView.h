//
//  AddInterventionView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import <UIKit/UIKit.h>

@protocol AddInterventionViewDelegate
- (void)dismissIntervention;
@end


@interface AddInterventionView : UIView <UITextViewDelegate> {

    UILabel *heading;
    UIImageView *bg;
    UITextView *textView;
    UIButton *dismissButton;
    UIButton *submitButton;
    __unsafe_unretained id <AddInterventionViewDelegate> delegate;
    
}

@property (nonatomic, assign) id <AddInterventionViewDelegate> delegate;

@end
