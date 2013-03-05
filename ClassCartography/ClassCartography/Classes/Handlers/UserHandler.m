//
//  UserHandler.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/4/13.
//
//

#import "UserHandler.h"


static UserHandler *sharedUserHandler;

@implementation UserHandler

@synthesize isLoggedIn;
@synthesize name;
@synthesize classes;


#pragma mark -
#pragma mark singleton init

- (id)init {
    if (self = [super init]) {
        isLoggedIn = NO;
        classes = [[NSMutableArray alloc] initWithCapacity:0];  
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone { return self; }


#pragma mark -
#pragma mark sharedInBloomAPIHandler methods

+ (UserHandler *)sharedUserHandler {
    @synchronized(self) {
        if (sharedUserHandler == nil) {
            sharedUserHandler = [[UserHandler alloc] init];
        }
    }
    
    return sharedUserHandler;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedUserHandler == nil) {
            sharedUserHandler = [super allocWithZone:zone];
        }
    }
    
    return sharedUserHandler;
}

@end
