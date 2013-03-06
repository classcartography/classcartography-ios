//
//  StudentDashboardViewController.h
//  ClassCartography
//
//  Created by Paul Lee on 3/5/13.
//
//

#import "DashboardViewController.h"
#import "InterventionView.h"
#import "GraphView.h" 

@interface StudentDashboardViewController : DashboardViewController {
    
    InterventionView *_interventionView;
    GraphView *graphView;

}

@end
