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
    NSString *studentImageName;
}

- (void) createStudentDummyData;
@property (nonatomic, copy) NSString *studentImageName;
- (id)initWithFrame:(CGRect)frame sim:(NSString *) sim;

@end
