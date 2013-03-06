//
//  Section.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import "Section.h"


@implementation Section

@synthesize name;
@synthesize lastAssignment;

- (id)init {
    if (self = [super init]) { }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
	Section *sectionCopy = [[[self class] allocWithZone:zone] init];
	
    [sectionCopy setName:name];
    [sectionCopy setLastAssignment:lastAssignment];
	
    return sectionCopy;
}


#pragma mark -
#pragma mark class methods

+ (id)generate:(NSDictionary *)d {
    Section *section = [[Section alloc] init];
    [section buildFromDictionary:d];
    
    return section;
}

#pragma mark -
#pragma mark public methods

- (void)buildFromDictionary:(NSDictionary *)d {
    name = [[d objectForKey:@"uniqueSectionCode"] copy];
}
        

@end
