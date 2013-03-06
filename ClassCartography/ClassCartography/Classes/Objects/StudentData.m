//
//  MobileBrowserUsageStats.m
//  LineChart

#import "StudentData.h"

@implementation StudentData

@synthesize understandingData = _understandingData;
@synthesize gradeData = _gradeData;
@synthesize understandingDays = _understandingDays;
@synthesize gradeDays = _gradeDays;

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        _understandingData = [NSMutableDictionary new];
        _gradeData = [NSMutableDictionary new];
        _understandingDays = [NSMutableArray new];
        _gradeDays = [NSMutableArray new];
        
//        [_understandingData setObject:[NSNumber numberWithFloat:84.00f] forKey:[formatter dateFromString:@"2012-09-01"]];
//        [_understandingData setObject:[NSNumber numberWithFloat:88.00f] forKey:[formatter dateFromString:@"2012-08-01"]];
//        [_understandingData setObject:[NSNumber numberWithFloat:80.00f] forKey:[formatter dateFromString:@"2012-07-01"]];
//        [_understandingData setObject:[NSNumber numberWithFloat:94.00f] forKey:[formatter dateFromString:@"2012-06-01"]];
//        [_understandingData setObject:[NSNumber numberWithFloat:74.00f] forKey:[formatter dateFromString:@"2012-05-01"]];
//        [_understandingData setObject:[NSNumber numberWithFloat:86.00f] forKey:[formatter dateFromString:@"2012-04-01"]];
//        [_understandingData setObject:[NSNumber numberWithFloat:93.00f] forKey:[formatter dateFromString:@"2012-03-01"]];
//        [_understandingData setObject:[NSNumber numberWithFloat:96.00f] forKey:[formatter dateFromString:@"2012-02-01"]];

        [_understandingData setObject:[NSNumber numberWithFloat:84.00f] forKey:@"Lesson 1"];
        [_understandingDays addObject:@"Lesson 1"];
        [_understandingData setObject:[NSNumber numberWithFloat:88.00f] forKey:@"HW 1"];
        [_understandingDays addObject:@"HW 1"];
        [_understandingData setObject:[NSNumber numberWithFloat:80.00f] forKey:@"Lesson 2"];
        [_understandingDays addObject:@"Lesson 2"];
        [_understandingData setObject:[NSNumber numberWithFloat:94.00f] forKey:@"HW 2"];
        [_understandingDays addObject:@"HW 2"];
        [_understandingData setObject:[NSNumber numberWithFloat:74.00f] forKey:@"Lesson 3"];
        [_understandingDays addObject:@"Lesson 3"];
        [_understandingData setObject:[NSNumber numberWithFloat:86.00f] forKey:@"HW 3"];
        [_understandingDays addObject:@"HW 3"];
        [_understandingData setObject:[NSNumber numberWithFloat:93.00f] forKey:@"Quiz 1"];
        [_understandingDays addObject:@"Quiz 1"];
        [_understandingData setObject:[NSNumber numberWithFloat:90.00f] forKey:@"Lesson 4"];
        [_understandingDays addObject:@"Lesson 4"];
        [_understandingData setObject:[NSNumber numberWithFloat:80.00f] forKey:@"HW 4"];
        [_understandingDays addObject:@"HW 4"];
        [_understandingData setObject:[NSNumber numberWithFloat:71.00f] forKey:@"Lesson 5"];
        [_understandingDays addObject:@"Lesson 5"];
        [_understandingData setObject:[NSNumber numberWithFloat:63.00f] forKey:@"HW 5"];
        [_understandingDays addObject:@"HW 5"];

//        [_gradeData setObject:[NSNumber numberWithFloat:67.00f] forKey:[formatter dateFromString:@"2012-09-01"]];
//        [_gradeData setObject:[NSNumber numberWithFloat:78.00f] forKey:[formatter dateFromString:@"2012-08-01"]];
//        [_gradeData setObject:[NSNumber numberWithFloat:80.00f] forKey:[formatter dateFromString:@"2012-07-01"]];
//        [_gradeData setObject:[NSNumber numberWithFloat:75.00f] forKey:[formatter dateFromString:@"2012-06-01"]];
//        [_gradeData setObject:[NSNumber numberWithFloat:79.00f] forKey:[formatter dateFromString:@"2012-05-01"]];
//        [_gradeData setObject:[NSNumber numberWithFloat:82.00f] forKey:[formatter dateFromString:@"2012-04-01"]];
//        [_gradeData setObject:[NSNumber numberWithFloat:87.00f] forKey:[formatter dateFromString:@"2012-03-01"]];
//        [_gradeData setObject:[NSNumber numberWithFloat:89.00f] forKey:[formatter dateFromString:@"2012-02-01"]];

//        [_gradeData setObject:[NSNumber numberWithFloat:67.00f] forKey:@"Lesson 1"];
//        [_gradeDays addObject:@"Lesson 1"];
        [_gradeData setObject:[NSNumber numberWithFloat:78.00f] forKey:@"HW 1"];
        [_gradeDays addObject:@"HW 1"];
//        [_gradeData setObject:[NSNumber numberWithFloat:80.00f] forKey:@"Lesson 2"];
//        [_gradeDays addObject:@"Lesson 2"];
        [_gradeData setObject:[NSNumber numberWithFloat:75.00f] forKey:@"HW 2"];
        [_gradeDays addObject:@"HW 2"];
//        [_gradeData setObject:[NSNumber numberWithFloat:79.00f] forKey:@"Lesson 3"];
//        [_gradeDays addObject:@"Lesson 3"];
        [_gradeData setObject:[NSNumber numberWithFloat:82.00f] forKey:@"HW 3"];
        [_gradeDays addObject:@"HW 3"];
        [_gradeData setObject:[NSNumber numberWithFloat:87.00f] forKey:@"Quiz 1"];
        [_gradeDays addObject:@"Quiz 1"];
//        [_gradeData setObject:[NSNumber numberWithFloat:89.00f] forKey:@"Lesson 4"];
//        [_gradeDays addObject:@"Lesson 4"];
        [_gradeData setObject:[NSNumber numberWithFloat:86.00f] forKey:@"HW 4"];
        [_gradeDays addObject:@"HW 4"];
//        [_gradeData setObject:[NSNumber numberWithFloat:60.00f] forKey:@"Lesson 5"];
//        [_gradeDays addObject:@"Lesson 5"];
        [_gradeData setObject:[NSNumber numberWithFloat:63.00f] forKey:@"HW 5"];
        [_gradeDays addObject:@"HW 5"];

        
//        _attendanceDays = [[_understandingData allKeys] sortedArrayUsingComparator:^(id obj1, id obj2) {
//            NSDate *d1 = (NSDate *)obj1;
//            NSDate *d2 = (NSDate *)obj2;
//            return [d1 compare:d2];
//        }];
//
//        _gradeDays = [[_gradeData allKeys] sortedArrayUsingComparator:^(id obj1, id obj2) {
//            NSDate *d1 = (NSDate *)obj1;
//            NSDate *d2 = (NSDate *)obj2;
//            return [d1 compare:d2];
//        }];
        
    }
    
    return self;
    
}

@end
