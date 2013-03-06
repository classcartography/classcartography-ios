//
//  User.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import "User.h"

@implementation User

@synthesize name;
@synthesize sections;

- (id)init {
    if (self = [super init]) {
        sections = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    return self;
}

@end
