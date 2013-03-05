//
//  MobileBrowserUsageStats.m
//  LineChart

#import "StudentData.h"

@implementation StudentData

@synthesize attendanceData = _attendanceData;
@synthesize gradeData = _gradeData;
@synthesize attendanceDays = _attendanceDays;
@synthesize gradeDays = _gradeDays;

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        _attendanceData = [NSMutableDictionary new];
        _gradeData = [NSMutableDictionary new];
        
        [_attendanceData setObject:[NSNumber numberWithFloat:84.00f] forKey:[formatter dateFromString:@"2012-09-01"]];
        [_attendanceData setObject:[NSNumber numberWithFloat:88.00f] forKey:[formatter dateFromString:@"2012-08-01"]];
        [_attendanceData setObject:[NSNumber numberWithFloat:80.00f] forKey:[formatter dateFromString:@"2012-07-01"]];
        [_attendanceData setObject:[NSNumber numberWithFloat:94.00f] forKey:[formatter dateFromString:@"2012-06-01"]];
        [_attendanceData setObject:[NSNumber numberWithFloat:74.00f] forKey:[formatter dateFromString:@"2012-05-01"]];
        [_attendanceData setObject:[NSNumber numberWithFloat:86.00f] forKey:[formatter dateFromString:@"2012-04-01"]];
        [_attendanceData setObject:[NSNumber numberWithFloat:93.00f] forKey:[formatter dateFromString:@"2012-03-01"]];
        [_attendanceData setObject:[NSNumber numberWithFloat:96.00f] forKey:[formatter dateFromString:@"2012-02-01"]];
        
        [_gradeData setObject:[NSNumber numberWithFloat:67.00f] forKey:[formatter dateFromString:@"2012-09-01"]];
        [_gradeData setObject:[NSNumber numberWithFloat:78.00f] forKey:[formatter dateFromString:@"2012-08-01"]];
        [_gradeData setObject:[NSNumber numberWithFloat:80.00f] forKey:[formatter dateFromString:@"2012-07-01"]];
        [_gradeData setObject:[NSNumber numberWithFloat:75.00f] forKey:[formatter dateFromString:@"2012-06-01"]];
        [_gradeData setObject:[NSNumber numberWithFloat:79.00f] forKey:[formatter dateFromString:@"2012-05-01"]];
        [_gradeData setObject:[NSNumber numberWithFloat:82.00f] forKey:[formatter dateFromString:@"2012-04-01"]];
        [_gradeData setObject:[NSNumber numberWithFloat:87.00f] forKey:[formatter dateFromString:@"2012-03-01"]];
        [_gradeData setObject:[NSNumber numberWithFloat:89.00f] forKey:[formatter dateFromString:@"2012-02-01"]];

        _attendanceDays = [[_attendanceData allKeys] sortedArrayUsingComparator:^(id obj1, id obj2) {
            NSDate *d1 = (NSDate *)obj1;
            NSDate *d2 = (NSDate *)obj2;
            return [d1 compare:d2];
        }];

        _gradeDays = [[_gradeData allKeys] sortedArrayUsingComparator:^(id obj1, id obj2) {
            NSDate *d1 = (NSDate *)obj1;
            NSDate *d2 = (NSDate *)obj2;
            return [d1 compare:d2];
        }];
        
    }
    
    return self;
    
}

@end
