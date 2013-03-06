//
//  Intervention.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import "Intervention.h"


@implementation Intervention

@synthesize interventionId;
@synthesize dateTime;
@synthesize comment;

- (id)init {
    if (self = [super init]) { }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
	Intervention *interventionCopy = [[[self class] allocWithZone:zone] init];
	
    [interventionCopy setInterventionId:interventionId];
    [interventionCopy setDateTime:dateTime];
    [interventionCopy setComment:comment];
	
    return interventionCopy;
}


#pragma mark -
#pragma mark class methods

+ (id)generate:(NSDictionary *)d {
    Intervention *intervention = [[Intervention alloc] init];
    [intervention buildFromDictionary:d];
    
    return intervention;
}

#pragma mark -
#pragma mark public methods

- (void)buildFromDictionary:(NSDictionary *)d {
    interventionId =[[d objectForKey:@"id"] intValue];
    dateTime = [[d objectForKey:@"dateTime"] copy];
    comment = [[d objectForKey:@"comment"] copy];
}

@end
