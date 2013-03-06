//
//  MobileBrowserUsageStats.h
//  LineChart

#import <Foundation/Foundation.h>
#import "GraphData.h"

//A class that contain broser usage stats - in particular these are mobile browser stats 
@interface StudentData : NSObject <GraphData>

@property (nonatomic) NSMutableDictionary *understandingData;
@property (nonatomic) NSMutableDictionary *gradeData;
@property (nonatomic) NSMutableArray *understandingDays;
@property (nonatomic) NSMutableArray *gradeDays;

@end
