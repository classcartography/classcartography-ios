//
//  TeacherDashboardViewController.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "TeacherDashboardViewController.h"
#import "Section.h"
#import "SectionsPopoverBackgroundView.h"
#import "StudentDashboardViewController.h"
#import "StudentsTableView.h"
#import "UserHandler.h"


@implementation TeacherDashboardViewController

- (id)init {
    if (self = [super init]) {
        [self.navigationItem setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"classcart-logo"]]];
        
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPopover)];
        _studentsTableViewIsVisible = NO;

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
    
    graphView = [[GraphView alloc] initWithFrame:CGRectMake(320, 85, 670, 290)];
    graphView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:graphView];
    
    _studentsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _studentsButton.frame = CGRectMake(920, 20, 104, 36);
    [_studentsButton setBackgroundColor:[UIColor colorWithRed:(51.0/255.0) green:(51.0/255.0) blue:(51.0/255.0) alpha:1.0]];
    [_studentsButton setTitle:@"<< Students" forState:UIControlStateNormal];
    [_studentsButton setTitle:@">> Students" forState:UIControlStateSelected];
    [_studentsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _studentsButton.titleLabel.font = [UIFont fontWithName:@"QuicksandBold-Regular" size:14];
    [_studentsButton setTitleEdgeInsets:UIEdgeInsetsMake(4, 0, 0, 0)];
    [_studentsButton addTarget:self action:@selector(toggleStudentsTableView) forControlEvents:UIControlEventTouchUpInside];
    _studentsButtonSlider = [[Slider alloc] initWithButton:_studentsButton];
    [_studentsButtonSlider slideButtonToVisible:NO withAnimation:NO];
    [self.view addSubview:_studentsButton];
    
    studentsTableView = [[StudentsTableView alloc] initWithFrame:CGRectMake(804, 0, 220, 724)];
    studentsTableView.backgroundColor = [UIColor colorWithRed:(51.0/255.0) green:(51.0/255.0) blue:(51.0/255.0) alpha:1.0];
    _studentsTableViewSlider = [[Slider alloc] initWithView:studentsTableView];
	[_studentsTableViewSlider slideViewToVisible:NO withAnimation:NO];
    studentsTableView.sDelegate = self;
    [self.view addSubview:studentsTableView];
    
    notificationView = [[NotificationView alloc] initWithFrame:CGRectMake(360, 391, 300, 320) forDashboard:@"teacher"];
    notificationView.backgroundColor = [UIColor grayColor];
    notificationView.delegate = self;
    [self.view addSubview:notificationView];
}

#pragma mark
#pragma mark private methods

- (void)showPopover {
    UITableViewController *tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableViewController.tableView.dataSource = self;
    tableViewController.contentSizeForViewInPopover = CGSizeMake(320, 210);
    
    _sectionsPopoverController = [[UIPopoverController alloc] initWithContentViewController:tableViewController];
    _sectionsPopoverController.popoverBackgroundViewClass = [SectionsPopoverBackgroundView class];
    
    CGRect frame = _howLabel.frame;
    frame.origin.y = _howLabel.frame.origin.y - 20;

    [_sectionsPopoverController presentPopoverFromRect:frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)toggleStudentsTableView {
    if (_studentsTableViewIsVisible == NO) {
        [_studentsButtonSlider slideButtonToVisible:YES withAnimation:YES];
        [_studentsTableViewSlider slideViewToVisible:YES withAnimation:YES];
        _studentsTableViewIsVisible = YES;
        _studentsButton.selected = YES;
    } else {
        [_studentsButtonSlider slideButtonToVisible:NO withAnimation:YES];
        [_studentsTableViewSlider slideViewToVisible:NO withAnimation:YES];
        _studentsTableViewIsVisible = NO;
        _studentsButton.selected = NO;
    }
}


#pragma mark
#pragma mark InBloomAPIHandlerDelegate methods

- (void)loginComplete {
    helloLabel.text = [NSString stringWithFormat:@"Hello, %@", [UserHandler sharedUserHandler].user.name];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)getSectionsComplete {
    NSString *sectionId = ((Section *)[[UserHandler sharedUserHandler].user.sections objectAtIndex:1]).sectionId;
    NSString *sectionName = ((Section *)[[UserHandler sharedUserHandler].user.sections objectAtIndex:1]).name;
    int l = [sectionName length];
    NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @1};
    const NSRange range = NSMakeRange(12,l);
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"How is your %@ class doing?", sectionName]
                                                             attributes:nil];
    [attributedText setAttributes:underlineAttribute range:range];
    _howLabel.attributedText = attributedText;
    
    //now get students for that class
    [[InBloomAPIHandler sharedInBloomAPIHandler] getStudentsInfoForSection:sectionId];
}

- (void)getStudentsComplete:(NSMutableArray *)arr {
    [((Section *)[[UserHandler sharedUserHandler].user.sections objectAtIndex:1]).students setArray:arr];
    NSArray *s = ((Section *)[[UserHandler sharedUserHandler].user.sections objectAtIndex:1]).students;
    [studentsTableView.students setArray:s];
    [studentsTableView reloadData];
    
    [notificationView.notifications setArray:s];
    [notificationView.notificationTable reloadData];

}



#pragma mark -
#pragma mark UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"gray-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)]];
    }
    cell.textLabel.text = ((Section *)[[UserHandler sharedUserHandler].user.sections objectAtIndex:indexPath.row]).name;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
    cell.textLabel.highlightedTextColor = [UIColor blackColor];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[UserHandler sharedUserHandler].user.sections count];
}


#pragma mark
#pragma mark PhotoViewDelegate methods

- (void)showStudentView {
    StudentDashboardViewController *svc = [[StudentDashboardViewController alloc] init];    
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)pushStudentViewController:(Student *)student {
    StudentDashboardViewController *svc = [[StudentDashboardViewController alloc] init];
    svc.student = student;
    [self.navigationController pushViewController:svc animated:YES];
}

@end
