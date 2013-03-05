//
//  mobileOSVersions.h
//  PieChart
//
//  Created by Stuart Grey on 18/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PieData.h"

@interface FeedbackData : NSObject <PieData>

@property (nonatomic) NSMutableDictionary *versionData;
@property (nonatomic) NSMutableDictionary *osData;
@property (nonatomic) NSArray *osTypes;
@property (nonatomic) NSArray *dataKeys;

@end
