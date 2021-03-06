//
//  StudentsTableView.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import "StudentsTableView.h"


@implementation StudentsTableView
@synthesize students, sDelegate;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        self.dataSource = self;
        students = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) createDummyData {
    
    [students removeAllObjects];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:@"temp" forKey:@"image"];
    [dict1 setObject:@"Paul Lee" forKey:@"description"];
    [students addObject:dict1];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:@"temp" forKey:@"image"];
    [dict2 setObject:@"Chamara Paul" forKey:@"description"];
    [students addObject:dict2];
    
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    [dict1 setObject:@"temp" forKey:@"image"];
    [dict1 setObject:@"Johnny B. Good" forKey:@"description"];
    [students addObject:dict3];
    
}

- (void)studentView:(Student *)student {
    [sDelegate pushStudentViewController:student];
}

#pragma mark ----------------------
#pragma mark Table Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return [students count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *studentCell = @"StudentTableCell";
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:studentCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:studentCell];
        cell.textLabel.font = [UIFont fontWithName:@"QuicksandBold-Regular" size:14];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"gray-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)]];
        cell.textLabel.highlightedTextColor = [UIColor blackColor];
    }
    
    if (students != nil && [students count] > 0) {
        Student *student = [students objectAtIndex:[indexPath row]];
        cell.textLabel.text = [NSString stringWithFormat:@"%@%@%@%@", student.firstName, (student.middleName != nil) ? [NSString stringWithFormat:@" %@ ", student.middleName] : @" ", student.lastName, (student.suffix != nil) ? [NSString stringWithFormat:@" %@ ", student.suffix] : @""];
//        cell.imageView.image = [UIImage imageNamed:student.imageName];
    }
    return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    [aTableView deselectRowAtIndexPath:indexPath animated:YES];
    [self studentView:[students objectAtIndex:[indexPath row]]];
    
}

-(BOOL)tableView:(UITableView*)tv canEditRowAtIndexPath:(NSIndexPath*)indexPath {
	return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}




@end
