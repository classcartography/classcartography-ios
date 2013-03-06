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
#import "Student.h"
#import "InBloomAPIHandler.h"

@interface StudentDashboardViewController : DashboardViewController <InterventionViewDelegate, AddInterventionViewDelegate, InBloomAPIHandlerStudentDelegate> {
    
    InterventionView *_interventionView;
    StudentGraphView *graphView;
    AddInterventionView *addInterventionView;
    UIView *opaqueView;
    Student *student;
}

- (id) initWithStudent:(Student *)stu;

@end
