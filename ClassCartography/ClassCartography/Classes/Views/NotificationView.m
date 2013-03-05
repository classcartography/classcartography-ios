//
//  NotificationView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "NotificationView.h"

@implementation NotificationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        title.text = @"Notifications";
        title.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:title];
        
        notificationTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 300, 280)];
        notificationTable.delegate = self;
        notificationTable.dataSource = self;
        [self addSubview:notificationTable];
        
        notifications = [[NSMutableArray alloc] init];
        [self createDummyData];
    }
    return self;
}

- (void) createDummyData {
    
    [notifications removeAllObjects];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:@"warning" forKey:@"imageName"];
    [dict1 setObject:@"Johnny had trouble with the last assignment." forKey:@"message"];
    [dict1 setObject:@"This " forKey:@"description"];
    [dict1 setObject:@"This was really difficult." forKey:@"comment"];
    [dict1 setObject:@"March 4, 2013 4:34pm" forKey:@"dateTime"];
    [notifications addObject:dict1];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:@"warning" forKey:@"imageName"];
    [dict2 setObject:@"itemstars-3" forKey:@"starsName"];
    [dict2 setObject:@"Jane Goodman" forKey:@"name"];
    [dict2 setObject:@"Quiz #1" forKey:@"assignment"];
    [dict2 setObject:@"This was too easy." forKey:@"comment"];
    [dict2 setObject:@"March 4, 2013 2:20pm" forKey:@"dateTime"];
    [notifications addObject:dict2];
    
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    [dict3 setObject:@"star" forKey:@"imageName"];
    [dict2 setObject:@"itemstars-5" forKey:@"starsName"];
    [dict3 setObject:@"Billy Joe" forKey:@"name"];
    [dict3 setObject:@"Homework #1" forKey:@"assignment"];
    [dict3 setObject:@"I didn't understand question 4." forKey:@"comment"];
    [dict3 setObject:@"March 4, 2013 1:12pm" forKey:@"dateTime"];
    [notifications addObject:dict3];
    
}


#pragma mark ----------------------
#pragma mark Table Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return [notifications count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *showCell = @"CommentTableCell";
    
    NotificationTableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:showCell];
    if (cell == nil) {
        cell = [[NotificationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict addEntriesFromDictionary:[notifications objectAtIndex:[indexPath row]]];
    [cell configureCell:dict forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    [aTableView deselectRowAtIndexPath:indexPath animated:YES];
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
