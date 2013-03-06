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

@protocol StudentsTableViewDelegate
- (void)pushStudentViewController:(Student *)student;
@end

@interface StudentsTableView : UITableView <UITableViewDataSource, UITableViewDelegate> {

    __unsafe_unretained id <StudentsTableViewDelegate> sDelegate;
    NSMutableArray *students;

}

@property (nonatomic, assign) id <StudentsTableViewDelegate> sDelegate;
@property (nonatomic, copy) NSMutableArray *students;

@end
