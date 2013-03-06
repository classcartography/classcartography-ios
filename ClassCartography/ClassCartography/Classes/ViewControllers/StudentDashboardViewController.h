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

@interface StudentDashboardViewController : DashboardViewController {
    
    InterventionView *_interventionView;
    StudentGraphView *graphView;

}

@end
