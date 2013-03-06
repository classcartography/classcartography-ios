//
//  TeacherDashboardViewController.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "DashboardViewController.h"
#import "FeedbackView.h"
#import "GraphView.h"
#import "Slider.h"
#import "StudentsTableView.h"

@interface TeacherDashboardViewController : DashboardViewController <UITableViewDataSource, PhotoViewDelegate, StudentsTableViewDelegate> {
    
@private
    UITapGestureRecognizer *_tap;
    UILabel *_howLabel;
    UIPopoverController *_sectionsPopoverController;
    FeedbackView *_feedbackView;
    GraphView *graphView;
    UIButton *_studentsButton;
    Slider *_studentsButtonSlider;
    BOOL _studentsTableViewIsVisible;
    Slider *_studentsTableViewSlider;
    StudentsTableView *studentsTableView;
}

//@property (nonatomic, assign) id <InterventionViewDelegate> delegate;

@end
