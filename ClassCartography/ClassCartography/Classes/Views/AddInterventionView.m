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
        
        heading = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 600, 40)];
        heading.font =  [UIFont fontWithName:@"QuicksandBook-Regular" size:24];
        heading.text = @"Add an intervention";
        heading.textAlignment = NSTextAlignmentCenter;
        heading.textColor = [UIColor blackColor];
        [self addSubview:heading];
        
        bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textview-bg"]];
        bg.frame = CGRectMake(100, 60, 400, 240);
        [self addSubview:bg];
        
        textView = [[UITextView alloc] initWithFrame:CGRectMake(110, 70, 380, 220)];
        textView.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:textView];
        
        dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
        dismissButton.frame = CGRectMake(550, 10, 40, 40);
        [dismissButton addTarget:self action:@selector(closeIntervention) forControlEvents:UIControlEventTouchDown];
        [dismissButton setBackgroundImage:[UIImage imageNamed:@"button-close"] forState:UIControlStateNormal];
        [self addSubview:dismissButton];
        
        submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        submitButton.frame = CGRectMake(240, 310, 120, 40);
        [submitButton addTarget:self action:@selector(closeIntervention) forControlEvents:UIControlEventTouchDown];
        [submitButton setBackgroundImage:[UIImage imageNamed:@"button-submit"] forState:UIControlStateNormal];
        [self addSubview:submitButton];
        
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
