//
//  Section.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import "Section.h"


@implementation Section

@synthesize sectionId;
@synthesize name;
@synthesize students;

- (id)init {
    if (self = [super init]) {
        students = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
	Section *sectionCopy = [[[self class] allocWithZone:zone] init];
	
    [sectionCopy setSectionId:sectionId];
    [sectionCopy setName:name];
    [sectionCopy setStudents:students];
	
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
    sectionId = [[d objectForKey:@"id"] copy];
    name = [[d objectForKey:@"uniqueSectionCode"] copy];
}
        

@end
