//
//  BrowserUsageStats.h
//  LineChart

#import <Foundation/Foundation.h>

#define attendance @"Attendance"
#define grade @"Grade"

//This interface allows the data source to take any kind of
//browser data as long as it conforms
@protocol GraphData <NSObject>

@required

- (NSMutableDictionary*) understandingData;
- (NSMutableDictionary*) gradeData;
- (NSMutableArray*) understandingDays;
- (NSMutableArray*) gradeDays;

@end
