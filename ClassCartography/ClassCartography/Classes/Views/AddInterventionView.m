//
//  AddInterventionView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import "AddInterventionView.h"

@implementation AddInterventionView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        heading = [[UILabel alloc] initWithFrame:CGRectMake(0, 18, 600, 24)];
        heading.font =  [UIFont fontWithName:@"QuicksandBold-Regular" size:18];
        heading.text = @"Add an intervention";
        heading.textAlignment = NSTextAlignmentCenter;
        heading.textColor = [UIColor blackColor];
        [self addSubview:heading];
        
        bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textview-bg"]];
        bg.frame = CGRectMake(26, 46, 550, 240);
        [self addSubview:bg];
        
        dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
        dismissButton.frame = CGRectMake(185, 300, 104, 36);
        [dismissButton addTarget:self action:@selector(closeIntervention) forControlEvents:UIControlEventTouchDown];
        [dismissButton setBackgroundImage:[UIImage imageNamed:@"button-cancel"] forState:UIControlStateNormal];
        [self addSubview:dismissButton];
        
        submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        submitButton.frame = CGRectMake(321, 300, 104, 36);
        [submitButton addTarget:self action:@selector(closeIntervention) forControlEvents:UIControlEventTouchDown];
        [submitButton setBackgroundImage:[UIImage imageNamed:@"button-submit"] forState:UIControlStateNormal];
        [self addSubview:submitButton];

        textView = [[UITextView alloc] initWithFrame:CGRectMake(30, 50, 540, 230)];
        textView.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
//        textView.backgroundColor = [UIColor grayColor];
        textView.textColor = [UIColor blackColor];
        textView.delegate = self;
        [self addSubview:textView];
        [self bringSubviewToFront:textView];
    }
    return self;
}

- (void) closeIntervention {
    [delegate dismissIntervention];
}

- (void) submitIntervention {
    [delegate dismissIntervention];
}



@end
