//
//  OSData.h
//  PieChart
//
//  Created by Stuart Grey on 21/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PieData <NSObject>

@required
- (NSMutableDictionary*)versionData;
- (NSMutableDictionary*)osData;
- (NSArray*)osTypes;
- (NSArray*)dataKeys;


@end
