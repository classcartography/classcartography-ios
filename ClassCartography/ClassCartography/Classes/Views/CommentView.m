//
//  CommentView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "CommentView.h"

@implementation CommentView
@synthesize studentImageName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        graphTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        graphTitle.text = @"Most Recent Comments";
        graphTitle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:graphTitle];
        
        commentTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 300, 300)];
        commentTable.delegate = self;
        commentTable.dataSource = self;
        [self addSubview:commentTable];
        
        comments = [[NSMutableArray alloc] init];
        [self createDummyData];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame sim:(NSString *) sim {
    self = [super initWithFrame:frame];
    if (self) {
        graphTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        graphTitle.text = @"Most Recent Comments";
        graphTitle.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:graphTitle];
        
        commentTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 300, 300)];
        commentTable.delegate = self;
        commentTable.dataSource = self;
        [self addSubview:commentTable];
        
        comments = [[NSMutableArray alloc] initWithCapacity:0];
        studentImageName = sim;
        [self createStudentDummyData];
        
    }
    return self;
}

- (void) createDummyData {
    
    [comments removeAllObjects];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:@"male-1.jpg" forKey:@"imageName"];
    [dict1 setObject:@"itemstars-4" forKey:@"starsName"];
    [dict1 setObject:@"John Smith" forKey:@"name"];
    [dict1 setObject:@"Quiz #2" forKey:@"assignment"];
    [dict1 setObject:@"Can you go over question 5 in class tomorrow?" forKey:@"comment"];
    [dict1 setObject:@"March 4, 2013 4:34pm" forKey:@"dateTime"];
    [comments addObject:dict1];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:@"female-1.jpg" forKey:@"imageName"];
    [dict2 setObject:@"itemstars-5" forKey:@"starsName"];
    [dict2 setObject:@"Jane Goodman" forKey:@"name"];
    [dict2 setObject:@"Homework #6" forKey:@"assignment"];
    [dict2 setObject:@"I didn't understand question 4." forKey:@"comment"];
    [dict2 setObject:@"March 4, 2013 2:20pm" forKey:@"dateTime"];
    [comments addObject:dict2];
    
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    [dict3 setObject:@"female-2.jpg" forKey:@"imageName"];
    [dict3 setObject:@"itemstars-5" forKey:@"starsName"];
    [dict3 setObject:@"Billy Joe" forKey:@"name"];
    [dict3 setObject:@"Homework #6" forKey:@"assignment"];
    [dict3 setObject:@"Is there a tutor that can help me with algebra??" forKey:@"comment"];
    [dict3 setObject:@"March 4, 2013 1:12pm" forKey:@"dateTime"];
    [comments addObject:dict3];
    
    
    NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
    [dict4 setObject:@"male-1.jpg" forKey:@"imageName"];
    [dict4 setObject:@"itemstars-5" forKey:@"starsName"];
    [dict4 setObject:@"Billy Joe" forKey:@"name"];
    [dict4 setObject:@"Homework #6" forKey:@"assignment"];
    [dict4 setObject:@"This homework assignment was really difficult." forKey:@"comment"];
    [dict4 setObject:@"March 4, 2013 1:12pm" forKey:@"dateTime"];
    [comments addObject:dict4];
    
}

- (void) createStudentDummyData {
    
    [comments removeAllObjects];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:studentImageName forKey:@"imageName"];
    [dict1 setObject:@"itemstars-4" forKey:@"starsName"];
    [dict1 setObject:@"John Smith" forKey:@"name"];
    [dict1 setObject:@"Homework #1" forKey:@"assignment"];
    [dict1 setObject:@"This was really difficult." forKey:@"comment"];
    [dict1 setObject:@"March 4, 2013 4:34pm" forKey:@"dateTime"];
    [comments addObject:dict1];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:studentImageName forKey:@"imageName"];
    [dict2 setObject:@"itemstars-5" forKey:@"starsName"];
    [dict2 setObject:@"Billy Joe" forKey:@"name"];
    [dict2 setObject:@"Homework #1" forKey:@"assignment"];
    [dict2 setObject:@"Difficulty: 8 out of 10" forKey:@"comment"];
    [dict2 setObject:@"March 4, 2013 1:12pm" forKey:@"dateTime"];
    [comments addObject:dict2];
    
}


#pragma mark ----------------------
#pragma mark Table Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return [comments count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *showCell = @"CommentTableCell";
    
    CommentTableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:showCell];
    if (cell == nil) {
        cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showCell];
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"gray-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)]];        
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict addEntriesFromDictionary:[comments objectAtIndex:[indexPath row]]];
    [cell configureCell:dict forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


@end
