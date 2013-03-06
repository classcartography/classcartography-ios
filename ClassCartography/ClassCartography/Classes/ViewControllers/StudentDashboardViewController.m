//
//  StudentDashboardViewController.m
//  ClassCartography
//
//  Created by Paul Lee on 3/5/13.
//
//

#import "StudentDashboardViewController.h"


@implementation StudentDashboardViewController

- (id)init {
    if (self = [super init]) {
        [self.navigationItem setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"classcart-logo"]]];
    }
    
    return self;
}

- (void)loadView {
    [super loadView];
    
    _interventionView = [[InterventionView alloc] initWithFrame:CGRectMake(30, 391, 300, 300)];
    _interventionView.backgroundColor = [UIColor whiteColor];
    _interventionView.delegate = self;
    [self.view addSubview:_interventionView];
    
    graphView = [[StudentGraphView alloc] initWithFrame:CGRectMake(320, 85, 670, 290)];
    graphView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:graphView];
    
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-bg"]];
    [photoView addSubview:bgView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 254, 254)];
    imageView.image = [UIImage imageNamed:@"haku"];
    imageView.backgroundColor = [UIColor blackColor];
    [photoView addSubview:imageView];
    
    [commentView createStudentDummyData];
    [notificationView createStudentDummyData];

    opaqueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    opaqueView.backgroundColor = [UIColor blackColor];
    opaqueView.alpha = 0;
//    opaqueView.hidden = YES;
    [self.view addSubview:opaqueView];
    
    addInterventionView = [[AddInterventionView alloc] initWithFrame:CGRectMake(200, -700, 600, 360)];
    addInterventionView.backgroundColor = [UIColor whiteColor];
    addInterventionView.delegate = self;
    [self.view addSubview:addInterventionView];

    
    
}

#pragma mark
#pragma mark InterventionViewDelegate methods

- (void) addIntervention {
    [self.view bringSubviewToFront:addInterventionView];
    [UIView beginAnimations:@"showIntervention" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    opaqueView.alpha = 0.6;
    addInterventionView.frame = CGRectMake(200, 100, 600, 360);
    [UIView commitAnimations];
}

#pragma mark
#pragma mark AddInterventionViewDelegate methods

- (void) dismissIntervention {
    [UIView beginAnimations:@"dismissIntervention" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    opaqueView.alpha = 0;
    addInterventionView.frame = CGRectMake(200, -700, 600, 360);
    [UIView commitAnimations];

}

@end
