//
//  mobileOSVersions.m
//  PieChart
//
//  Created by Stuart Grey on 18/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import "FeedbackData.h"

@implementation FeedbackData

- (id)init {
    self = [super init];
    
    if (self) {
        
        _osData = [NSMutableDictionary new];
        _versionData = [NSMutableDictionary new];
        _dataKeys = [NSArray arrayWithObjects:@"item", @"uptake_pct", nil];
        _osTypes = [NSArray arrayWithObjects:@"No", @"Yes", nil];
        
        [_osData setObject:[NSNumber numberWithFloat:62.0f] forKey:@"No"];
        [_osData setObject:[NSNumber numberWithFloat:38.0f] forKey:@"Yes"];
//        [_osData setObject:[NSNumber numberWithFloat:9.5f] forKey:@"BlackBerry"];
//        [_osData setObject:[NSNumber numberWithFloat:3.6f] forKey:@"WindowsPhone"];
//        [_osData setObject:[NSNumber numberWithFloat:0.8f] forKey:@"Symbian"];
        
        NSMutableArray *iosData = [NSMutableArray new];
        [iosData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"5.1.x", [NSNumber numberWithFloat:87.8f],nil] forKeys:_dataKeys]];
        [iosData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"5.0.x", [NSNumber numberWithFloat:3.3f],nil] forKeys:_dataKeys]];
//        [iosData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"4.3.x", [NSNumber numberWithFloat:5.2f],nil] forKeys:_dataKeys]];
//        [iosData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"4.2.x", [NSNumber numberWithFloat:2.9f],nil] forKeys:_dataKeys]];
//        [iosData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"4.1.x", [NSNumber numberWithFloat:0.7f],nil] forKeys:_dataKeys]];
//        [iosData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"4.0.x", [NSNumber numberWithFloat:0.2f],nil] forKeys:_dataKeys]];
        [_versionData setObject:iosData forKey:[_osTypes objectAtIndex:0]];
        
        NSMutableArray *androidData = [NSMutableArray new];
        [androidData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"4.1", [NSNumber numberWithFloat:0.8f],nil] forKeys:_dataKeys]];
        [androidData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"4.0.x", [NSNumber numberWithFloat:15.9f],nil] forKeys:_dataKeys]];
//        [androidData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"3.x", [NSNumber numberWithFloat:2.3f],nil] forKeys:_dataKeys]];
//        [androidData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"2.3.x", [NSNumber numberWithFloat:60.6f],nil] forKeys:_dataKeys]];
//        [androidData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"2.2", [NSNumber numberWithFloat:15.5f],nil] forKeys:_dataKeys]];
//        [androidData addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"2.1", [NSNumber numberWithFloat:4.2f],nil] forKeys:_dataKeys]];
        [_versionData setObject:androidData forKey:[_osTypes objectAtIndex:1]];
        
        
        
    }
    return self;
}


@end
