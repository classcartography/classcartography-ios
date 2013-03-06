//
//  StudentDashboardViewController.h
//  ClassCartography
//
//  Created by Paul Lee on 3/5/13.
//
//

#import "DashboardViewController.h"
#import "InterventionView.h"
#import "StudentGraphView.h"
#import "AddInterventionView.h"

@interface StudentDashboardViewController : DashboardViewController <InterventionViewDelegate, AddInterventionViewDelegate> {
    
    InterventionView *_interventionView;
    StudentGraphView *graphView;
    AddInterventionView *addInterventionView;
    UIView *opaqueView;
    Student *student;
}

- (id) initWithStudent:stu;

@end
