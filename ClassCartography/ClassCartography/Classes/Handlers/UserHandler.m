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


#pragma mark -
#pragma mark singleton init

- (id)init {
    if (self = [super init]) {
        isLoggedIn = NO;
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
