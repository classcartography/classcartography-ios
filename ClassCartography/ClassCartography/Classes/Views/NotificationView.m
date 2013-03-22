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
@synthesize notifications;
@synthesize notificationTable;

- (id)initWithFrame:(CGRect)frame forDashboard:(NSString *)dashboardType {
    if (self = [super initWithFrame:frame]) {
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        title.text = @"Notifications";
        title.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:title];
        
        notifications = [[NSMutableArray alloc] initWithCapacity:0];
        
        notificationTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 300, 300)];
        notificationTable.delegate = self;
        notificationTable.dataSource = self;
        [self addSubview:notificationTable];
        
        if ([dashboardType isEqualToString:@"student"]) {
            [self createStudentDummyData];
            _isStudent = YES;
        } else {
            _isStudent = NO;
        }
    }
    
    return self;
}


#pragma mark -
#pragma mark private methods

- (void)createStudentDummyData {
    [notifications removeAllObjects];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:@"warning" forKey:@"imageName"];
    [dict1 setObject:@"Johnny had trouble with the last assignment." forKey:@"message"];
    [dict1 setObject:@"Alton didn't understand the last 3 homework assignments." forKey:@"description"];
    [dict1 setObject:@"This was really difficult." forKey:@"comment"];
    [dict1 setObject:@"March 3, 2013 4:10pm" forKey:@"dateTime"];
    [notifications addObject:dict1];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:@"warning" forKey:@"imageName"];
    [dict2 setObject:@"Johnny had trouble with the last assignment." forKey:@"message"];
    [dict2 setObject:@"Alton grades have been dropping." forKey:@"description"];
    [dict2 setObject:@"This was really difficult." forKey:@"comment"];
    [dict2 setObject:@"Feb 20, 2013 4:10pm" forKey:@"dateTime"];
    [notifications addObject:dict1];
}


#pragma mark -
#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return notifications.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *showCell = @"Cell";
    
    NotificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showCell];
    if (cell == nil) {
        cell = [[NotificationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"gray-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)]];
        if (_isStudent) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    
    if (_isStudent) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict addEntriesFromDictionary:[notifications objectAtIndex:[indexPath row]]];
        [cell configureCell:dict forIndexPath:indexPath];
    } else {
        NSString *d;
        NSString *imgName;
        if ([indexPath row] == 0) {
            imgName = @"warning";
            d = @"didn't understand the last 3 homework assignments.";
        } else if ([indexPath row] == 1) {
            imgName = @"warning";
            d = @"had trouble with the last quiz. Her last comment was \"Too many questions!\"";
        } else if ([indexPath row] == 2) {
            imgName = @"warning";
            d = @"did not hand in his last 3 homework assignments. His last comment was \"I didn't have enough time to finish.\"";
        } else if ([indexPath row] == 3) {
            imgName = @"star";
            d = @"may need more challenging work. Her last comment was \"This quiz was really easy.\"";
        } else if ([indexPath row] == 4) {
            imgName = @"warning";
            d = @"didn't understand the last 3 lessons.";
        }
        
        [cell configureCell:[notifications objectAtIndex:[indexPath row]] message:d im:imgName forIndexPath:indexPath];
    }
    
    return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    if (!_isStudent) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [delegate showStudentView:[notifications objectAtIndex:[indexPath row]]];
    }
}

@end
