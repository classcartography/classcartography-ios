//
//  StudentsTableView.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import <UIKit/UIKit.h>

@interface StudentsTableView : UITableView <UITableViewDataSource, UITableViewDelegate> {

    NSMutableArray *students;
}

@end
