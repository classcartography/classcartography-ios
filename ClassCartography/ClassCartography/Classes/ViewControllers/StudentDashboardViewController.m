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
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    _gradeView = [[GradeView alloc] initWithFrame:CGRectMake(30, 391, 300, 350)];
    _gradeView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_gradeView];
    
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-bg"]];
    [photoView addSubview:bgView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 254, 254)];
    imageView.image = [UIImage imageNamed:@"haku"];
    imageView.backgroundColor = [UIColor blackColor];
    [photoView addSubview:imageView];
    
    [commentView createStudentDummyData];
}


@end
