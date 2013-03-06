//
//  NotificationView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "NotificationView.h"

@implementation NotificationView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        title.text = @"Notifications";
        title.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:title];
        
        notificationTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 300, 300)];
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
    [dict1 setObject:@"Johnny didn't understand the last 3 homework assignments." forKey:@"description"];
    [dict1 setObject:@"This was really difficult." forKey:@"comment"];
    [dict1 setObject:@"March 3, 2013 4:10pm" forKey:@"dateTime"];
    [notifications addObject:dict1];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:@"warning" forKey:@"imageName"];
    [dict2 setObject:@"Susie may need more challenging work." forKey:@"message"];
    [dict2 setObject:@"Sally had trouble with the last quiz. Her last comment was \"Too many questions!\"" forKey:@"description"];
    [dict2 setObject:@"March 3, 2013 1:15pm" forKey:@"dateTime"];
    [notifications addObject:dict2];
    
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    [dict3 setObject:@"warning" forKey:@"imageName"];
    [dict3 setObject:@"Susie may need more challenging work." forKey:@"message"];
    [dict3 setObject:@"Billy did not hand in his last 3 homework assignments. His last comment was \"I didn't have enough time to finish.\"" forKey:@"description"];
    [dict3 setObject:@"March 3, 2013 1:15pm" forKey:@"dateTime"];
    [notifications addObject:dict3];

    NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
    [dict4 setObject:@"star" forKey:@"imageName"];
    [dict4 setObject:@"Susie may need more challenging work." forKey:@"message"];
    [dict4 setObject:@"Susie may need more challenging work. Her last comment was \"This quiz was really easy.\"" forKey:@"description"];
    [dict4 setObject:@"March 3, 2013 1:15pm" forKey:@"dateTime"];
    [notifications addObject:dict4];
    
    NSMutableDictionary *dict5 = [NSMutableDictionary dictionary];
    [dict5 setObject:@"warning" forKey:@"imageName"];
    [dict5 setObject:@"Danny may need more challenging work." forKey:@"message"];
    [dict5 setObject:@"Danny didn't understand the last 3 lessons." forKey:@"description"];
    [dict5 setObject:@"March 3, 2013 1:15pm" forKey:@"dateTime"];
    [notifications addObject:dict5];
    
}

- (void) createStudentDummyData {
    
    [notifications removeAllObjects];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:@"warning" forKey:@"imageName"];
    [dict1 setObject:@"Johnny had trouble with the last assignment." forKey:@"message"];
    [dict1 setObject:@"Johnny didn't understand the last 3 homework assignments." forKey:@"description"];
    [dict1 setObject:@"This was really difficult." forKey:@"comment"];
    [dict1 setObject:@"March 3, 2013 4:10pm" forKey:@"dateTime"];
    [notifications addObject:dict1];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:@"warning" forKey:@"imageName"];
    [dict2 setObject:@"Johnny had trouble with the last assignment." forKey:@"message"];
    [dict2 setObject:@"Johnny's grades have been dropping." forKey:@"description"];
    [dict2 setObject:@"This was really difficult." forKey:@"comment"];
    [dict2 setObject:@"Feb 20, 2013 4:10pm" forKey:@"dateTime"];
    [notifications addObject:dict1];
    
}

- (void)studentView {
    [delegate showStudentView];
}


#pragma mark ----------------------
#pragma mark Table Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
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
    [self studentView];
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
