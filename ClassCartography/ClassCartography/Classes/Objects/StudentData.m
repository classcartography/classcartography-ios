//
//  MobileBrowserUsageStats.m
//  LineChart

#import "StudentData.h"

@implementation StudentData

@synthesize data = _data;
@synthesize dataKeys = _dataKeys;
@synthesize months = _months;

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        _data = [NSMutableDictionary new];
                
        _dataKeys = [NSArray arrayWithObjects:@"Attendance", @"Grade", nil];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        _months = [NSArray arrayWithObjects:
                   [formatter dateFromString:@"2012-03-01"],
                   [formatter dateFromString:@"2012-02-11"],
                   [formatter dateFromString:@"2012-01-01"],
                   [formatter dateFromString:@"2011-12-01"],
                   [formatter dateFromString:@"2011-11-01"],
                   [formatter dateFromString:@"2011-10-01"],
                   [formatter dateFromString:@"2011-09-01"],
                   [formatter dateFromString:@"2011-08-01"],
                   [formatter dateFromString:@"2011-07-01"],
                   [formatter dateFromString:@"2011-06-01"],
                   [formatter dateFromString:@"2011-05-01"],
                   [formatter dateFromString:@"2011-04-01"],
                   nil];
        
        NSDictionary *mar12Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:22.86f],
                                                                       [NSNumber numberWithFloat:21.16f],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:mar12Data forKey:[_months objectAtIndex:0]];
        
        NSDictionary *feb12Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.07f],
                                                                       [NSNumber numberWithFloat:22.67f],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:feb12Data forKey:[_months objectAtIndex:1]];
        
        NSDictionary *jan12Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:23.34f],
                                                                       [NSNumber numberWithFloat:21.39f],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:jan12Data forKey:[_months objectAtIndex:2]];
        
        NSDictionary *dec11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:24.22],
                                                                       [NSNumber numberWithFloat:20.22],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:dec11Data forKey:[_months objectAtIndex:3]];
        
        NSDictionary *nov11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:22.49],
                                                                       [NSNumber numberWithFloat:20.41],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:nov11Data forKey:[_months objectAtIndex:4]];
        
        NSDictionary *oct11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.52],
                                                                       [NSNumber numberWithFloat:20.88],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:oct11Data forKey:[_months objectAtIndex:5]];
        
        NSDictionary *sep11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:22.45],
                                                                       [NSNumber numberWithFloat:19.90],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:sep11Data forKey:[_months objectAtIndex:6]];
        
        NSDictionary *aug11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.61],
                                                                       [NSNumber numberWithFloat:19.72],
                                                                       nil] forKeys:_dataKeys];
        
        [_data setObject:aug11Data forKey:[_months objectAtIndex:7]];
        
        NSDictionary *jul11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:22.07],
                                                                       [NSNumber numberWithFloat:18.17],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:jul11Data forKey:[_months objectAtIndex:8]];
        
        NSDictionary *jun11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:22.81],
                                                                       [NSNumber numberWithFloat:17.25],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:jun11Data forKey:[_months objectAtIndex:9]];
        
        NSDictionary *may11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.81],
                                                                       [NSNumber numberWithFloat:17.01],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:may11Data forKey:[_months objectAtIndex:10]];
        
        NSDictionary *apr11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.90],
                                                                       [NSNumber numberWithFloat:15.49],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:apr11Data forKey:[_months objectAtIndex:11]];
        
        
    }
    
    return self;
    
}

@end
