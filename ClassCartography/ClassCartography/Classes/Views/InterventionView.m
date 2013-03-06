//
//  InterventionView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import "InterventionView.h"

@implementation InterventionView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
        title.text = @"Interventions";
        title.font = [UIFont fontWithName:@"QuicksandBook-Regular" size:16];
        [self addSubview:title];

        addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addButton.frame = CGRectMake(240, 0, 60, 20);
        [addButton addTarget:self action:@selector(showIntervention) forControlEvents:UIControlEventTouchDown];
//        [addButton setTitle:@"Add" forState:UIControlStateNormal];
//        addButton.titleLabel.font = [UIFont fontWithName:@"QuicksandBook-Bold" size:14];
//        [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        [addButton setBackgroundImage:[UIImage imageNamed:@"button-add"] forState:UIControlStateNormal];
        [self addSubview:addButton];
        
        interventionTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 300, 300)];
        interventionTable.delegate = self;
        interventionTable.dataSource = self;
        [self addSubview:interventionTable];
        
        interventions = [[NSMutableArray alloc] init];
        [self createDummyData];
        
    }
    return self;
}

- (void) showIntervention {
    [delegate addIntervention];
}


- (void) createDummyData {
    
    [interventions removeAllObjects];

    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setObject:@"Intervention #1" forKey:@"message"];
    [dict2 setObject:@"Spoke with Johnny's parents about more study at home." forKey:@"description"];
    [dict2 setObject:@"February 21, 2013 1:15pm" forKey:@"dateTime"];
    [interventions addObject:dict2];
    
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:@"Intervention #2" forKey:@"message"];
    [dict1 setObject:@"Recommended after school study program." forKey:@"description"];
    [dict1 setObject:@"March 1, 2013 3:40pm" forKey:@"dateTime"];
    [interventions addObject:dict1];
    
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    [dict3 setObject:@"Intervention #3" forKey:@"message"];
    [dict3 setObject:@"Assigned Tommy to tutor Johnny." forKey:@"description"];
    [dict3 setObject:@"February 15, 2013 1:15pm" forKey:@"dateTime"];
    [interventions addObject:dict3];
    
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
    return [interventions count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *interventionCell = @"InterventionTableCell";
    
    InterventionTableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:interventionCell];
    if (cell == nil) {
        cell = [[InterventionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:interventionCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict addEntriesFromDictionary:[interventions objectAtIndex:[indexPath row]]];
    [cell configureCell:dict forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
//    [aTableView deselectRowAtIndexPath:indexPath animated:YES];
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
