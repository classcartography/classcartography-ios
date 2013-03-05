//
//  MobileBrowserUsageStats.h
//  LineChart

#import <Foundation/Foundation.h>
#import "GraphData.h"

//A class that contain broser usage stats - in particular these are mobile browser stats 
@interface StudentData : NSObject <GraphData>

@property (nonatomic) NSMutableDictionary *data;
@property (nonatomic) NSArray *months;
@property (nonatomic) NSArray *dataKeys;

@end
