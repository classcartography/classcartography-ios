//
//  CommentView.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import <UIKit/UIKit.h>
#import "CommentTableViewCell.h"

@interface CommentView : UIView <UITableViewDataSource, UITableViewDelegate> {
    
    UILabel *graphTitle;
    UITableView *commentTable;
    NSMutableArray *comments;
}

- (void) createStudentDummyData;

@end
