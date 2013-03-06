//
//  InterventionView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import <UIKit/UIKit.h>
#import "InterventionTableViewCell.h"

@protocol InterventionViewDelegate
- (void)addIntervention;
@end

@interface InterventionView : UIView <UITableViewDataSource, UITableViewDelegate> {

    UILabel *title;
    UIButton *addButton;
    UITableView *interventionTable;
    NSMutableArray *interventions;
    __unsafe_unretained id <InterventionViewDelegate> delegate;

}

@property (nonatomic, assign) id <InterventionViewDelegate> delegate;

@end
