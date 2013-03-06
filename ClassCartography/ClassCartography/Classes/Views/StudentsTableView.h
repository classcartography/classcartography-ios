//
//  StudentsTableView.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import <UIKit/UIKit.h>
#import "Section.h"
#import "Student.h"
#import "UserHandler.h"

@interface StudentsTableView : UITableView <UITableViewDataSource, UITableViewDelegate> {

    NSMutableArray *students;

}

@property (nonatomic, copy) NSMutableArray *students;

@end
