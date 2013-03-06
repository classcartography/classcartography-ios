//
//  TeacherDashboardViewController.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "TeacherDashboardViewController.h"
#import "ClassesPopoverBackgroundView.h"
#import "StudentDashboardViewController.h"
#import "UserHandler.h"


@implementation TeacherDashboardViewController

- (id)init {
    if (self = [super init]) {
        [self.navigationItem setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"classcart-logo"]]];
        
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPopover)];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    photoView.delegate = self;
    
    _howLabel = [[UILabel alloc] initWithFrame:CGRectMake(350, 10, 520, 60)];
    _howLabel.backgroundColor = [UIColor clearColor];
    _howLabel.textColor = [UIColor blackColor];
    _howLabel.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:20];
    _howLabel.userInteractionEnabled = YES;
    [_howLabel addGestureRecognizer:_tap];
    [self.view addSubview:_howLabel];
    
    _feedbackView = [[FeedbackView alloc] initWithFrame:CGRectMake(30, 391, 300, 350)];
    _feedbackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_feedbackView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(920, 20, 104, 36);
    [button setBackgroundColor:[UIColor colorWithRed:(51.0/255.0) green:(51.0/255.0) blue:(51.0/255.0) alpha:1.0]];
    [button setTitle:@"<< Students" forState:UIControlStateNormal];
    [button setTitle:@">> Students" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"QuicksandBold-Regular" size:14];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(4, 0, 0, 0)];
    [self.view addSubview:button];
}

#pragma mark
#pragma mark private methods

- (void)showPopover {
    UITableViewController *tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableViewController.tableView.dataSource = self;
    tableViewController.contentSizeForViewInPopover = CGSizeMake(320, 210);
    
    _classesPopoverController = [[UIPopoverController alloc] initWithContentViewController:tableViewController];    
    _classesPopoverController.popoverBackgroundViewClass = [ClassesPopoverBackgroundView class];
    
    CGRect frame = _howLabel.frame;
    frame.origin.y = _howLabel.frame.origin.y - 20;

    [_classesPopoverController presentPopoverFromRect:frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}


#pragma mark
#pragma mark InBloomAPIHandlerDelegate methods

- (void)loginComplete {
    helloLabel.text = [NSString stringWithFormat:@"Hello, %@", [UserHandler sharedUserHandler].user.name];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)getSectionsComplete {
    NSString *sectionName = [[[UserHandler sharedUserHandler].user.sections objectAtIndex:0] objectForKey:@"uniqueSectionCode"];
    int l = [sectionName length];
    NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @1};
    const NSRange range = NSMakeRange(12,l);
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"How is your %@ class doing?", sectionName]
                                                             attributes:nil];
    [attributedText setAttributes:underlineAttribute range:range];
    _howLabel.attributedText = attributedText;
}



#pragma mark -
#pragma mark UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[[UserHandler sharedUserHandler].user.sections objectAtIndex:indexPath.row] objectForKey:@"uniqueSectionCode"];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return [[UserHandler sharedUserHandler].user.sections count]; }


#pragma mark
#pragma mark PhotoViewDelegate methods

- (void)showStudentView {
    StudentDashboardViewController *svc = [[StudentDashboardViewController alloc] init];
    
    [self.navigationController pushViewController:svc animated:YES];
}

@end
