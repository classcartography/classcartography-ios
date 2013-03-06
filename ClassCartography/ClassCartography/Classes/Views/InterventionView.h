//
//  InterventionView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import <UIKit/UIKit.h>
#import "InterventionTableViewCell.h"

@interface InterventionView : UIView <UITableViewDataSource, UITableViewDelegate> {

    UILabel *title;
    UITableView *interventionTable;
    NSMutableArray *interventions;

}

@end
