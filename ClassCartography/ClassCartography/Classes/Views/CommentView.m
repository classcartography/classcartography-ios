//
//  CommentView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "CommentView.h"

@implementation CommentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        graphTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        graphTitle.text = @"Comments";
        graphTitle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:graphTitle];
        
        commentTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 300, 280)];
        commentTable.delegate = self;
        commentTable.dataSource = self;
        [self addSubview:commentTable];
        
        comments = [[NSMutableArray alloc] init];
        [self createDummyData];
    }
    return self;
}

- (void) createDummyData {
    
    [comments removeAllObjects];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:@"temp" forKey:@"imageName"];
    [dict1 setObject:@"itemstars-4" forKey:@"starsName"];
    [dict1 setObject:@"John Smith" forKey:@"name"];
    [dict1 setObject:@"Homework #1" forKey:@"assignment"];
    [dict1 setObject:@"This was really difficult." forKey:@"comment"];
    [dict1 setObject:@"March 4, 2013 4:34pm" forKey:@"dateTime"];
    [comments addObject:dict1];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:@"temp" forKey:@"imageName"];
    [dict2 setObject:@"itemstars-3" forKey:@"starsName"];
    [dict2 setObject:@"Jane Goodman" forKey:@"name"];
    [dict2 setObject:@"Quiz #1" forKey:@"assignment"];
    [dict2 setObject:@"This was too easy." forKey:@"comment"];
    [dict2 setObject:@"March 4, 2013 2:20pm" forKey:@"dateTime"];
    [comments addObject:dict2];
    
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    [dict3 setObject:@"temp" forKey:@"imageName"];
    [dict2 setObject:@"itemstars-5" forKey:@"starsName"];
    [dict3 setObject:@"Billy Joe" forKey:@"name"];
    [dict3 setObject:@"Homework #1" forKey:@"assignment"];
    [dict3 setObject:@"I didn't understand question 4." forKey:@"comment"];
    [dict3 setObject:@"March 4, 2013 1:12pm" forKey:@"dateTime"];
    [comments addObject:dict3];
    
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
    return [comments count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *showCell = @"CommentTableCell";
    
    CommentTableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:showCell];
    if (cell == nil) {
        cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict addEntriesFromDictionary:[comments objectAtIndex:[indexPath row]]];
    [cell configureCell:dict forIndexPath:indexPath];
    if ([indexPath row] == 1) {
        cell.stars.hidden = NO;
        cell.comment.hidden = YES;
    }
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
