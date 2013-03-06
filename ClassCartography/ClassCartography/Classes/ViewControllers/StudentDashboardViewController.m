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
    [self.view addSubview:_interventionView];
    
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-bg"]];
    [photoView addSubview:bgView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 254, 254)];
    imageView.image = [UIImage imageNamed:@"haku"];
    imageView.backgroundColor = [UIColor blackColor];
    [photoView addSubview:imageView];
    
    [commentView createStudentDummyData];
}


@end
