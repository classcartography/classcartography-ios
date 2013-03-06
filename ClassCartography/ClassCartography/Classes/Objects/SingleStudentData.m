//
//  SingleStudentData.m
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import "SingleStudentData.h"

@implementation SingleStudentData

@synthesize interventionData = _interventionData;
@synthesize gradeData = _gradeData;
@synthesize interventionDays = _interventionDays;
@synthesize gradeDays = _gradeDays;

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        _interventionData = [NSMutableDictionary new];
        _gradeData = [NSMutableDictionary new];
        _interventionDays = [NSMutableArray new];
        _gradeDays = [NSMutableArray new];
        
//        [_interventionData setObject:[NSNumber numberWithFloat:50.00f] forKey:@"HW 1"];
//        [_interventionDays addObject:@"HW 1"];
//        [_interventionData setObject:@"Intervention 1" forKey:@"HW 2"];
//        [_interventionDays addObject:@"HW 2"];
        [_interventionData setObject:[NSNumber numberWithFloat:66.00f] forKey:@"HW 2"];
        [_interventionDays addObject:@"HW 2"];
//        [_interventionData setObject:[NSNumber numberWithFloat:50.00f] forKey:@"HW 3"];
//        [_interventionDays addObject:@"HW 3"];
//        [_interventionData setObject:[NSNumber numberWithFloat:50.00f] forKey:@"Quiz 1"];
//        [_interventionDays addObject:@"Quiz 1"];
        [_interventionData setObject:[NSNumber numberWithFloat:78.00f] forKey:@"HW 4"];
        [_interventionDays addObject:@"HW 4"];
//        [_interventionData setObject:[NSNumber numberWithFloat:50.00f] forKey:@"HW 5"];
//        [_interventionDays addObject:@"HW 5"];
//        [_interventionData setObject:[NSNumber numberWithFloat:50.00f] forKey:@"HW 6"];
//        [_interventionDays addObject:@"HW 6"];
        [_interventionData setObject:[NSNumber numberWithFloat:78.00f] forKey:@"Quiz 2"];
        [_interventionDays addObject:@"Quiz 2"];
//        [_interventionData setObject:[NSNumber numberWithFloat:50.00f] forKey:@"HW 7"];
//        [_interventionDays addObject:@"HW 7"];
        
        [_gradeData setObject:[NSNumber numberWithFloat:76.00f] forKey:@"HW 1"];
        [_gradeDays addObject:@"HW 1"];
        [_gradeData setObject:[NSNumber numberWithFloat:66.00f] forKey:@"HW 2"];
        [_gradeDays addObject:@"HW 2"];
        [_gradeData setObject:[NSNumber numberWithFloat:80.00f] forKey:@"HW 3"];
        [_gradeDays addObject:@"HW 3"];
        [_gradeData setObject:[NSNumber numberWithFloat:87.00f] forKey:@"Quiz 1"];
        [_gradeDays addObject:@"Quiz 1"];
        [_gradeData setObject:[NSNumber numberWithFloat:78.00f] forKey:@"HW 4"];
        [_gradeDays addObject:@"HW 4"];
        [_gradeData setObject:[NSNumber numberWithFloat:63.00f] forKey:@"HW 5"];
        [_gradeDays addObject:@"HW 5"];
        [_gradeData setObject:[NSNumber numberWithFloat:84.00f] forKey:@"HW 6"];
        [_gradeDays addObject:@"HW 6"];
        [_gradeData setObject:[NSNumber numberWithFloat:78.00f] forKey:@"Quiz 2"];
        [_gradeDays addObject:@"Quiz 2"];
        [_gradeData setObject:[NSNumber numberWithFloat:90.00f] forKey:@"HW 7"];
        [_gradeDays addObject:@"HW 7"];
        
    }
    
    return self;
    
}

@end
