//
//  InBloomAPIHandler.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/4/13.
//
//

#import "InBloomAPIHandler.h"
#import "AFJSONRequestOperation.h"
#import "AFHTTPRequestOperation.h"


static InBloomAPIHandler *sharedInBloomAPIHandler;

@implementation InBloomAPIHandler

@synthesize connectionDelegate;


#pragma mark -
#pragma mark singleton init

- (id)init {
    if (self = [super init]) {
        _httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:INBLOOM_API_ROOT]];
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone { return self; }


#pragma mark -
#pragma mark public methods

- (void)authenticate {
    NSString *authUrl = [NSString stringWithFormat:@"%@/api/oauth/authorize?client_id=%@&response_type=code&redirect_uri=class://", INBLOOM_API_ROOT, INBLOOM_CLIENT_ID];
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:authUrl]];
    /*
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:INBLOOM_CLIENT_ID, @"client_id", @"code", @"response_type", @"class://login", @"redirect_uri", nil];
    [_httpClient getPath:@"/api/oauth/authorize" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", operation.responseString);
        //[connectionDelegate continueLogin];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }]; */
}


#pragma mark -
#pragma mark sharedInBloomAPIHandler methods

+ (InBloomAPIHandler *)sharedInBloomAPIHandler {
    @synchronized(self) {
        if (sharedInBloomAPIHandler == nil) {
            sharedInBloomAPIHandler = [[InBloomAPIHandler alloc] init];
        }
    }
    
    return sharedInBloomAPIHandler;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedInBloomAPIHandler == nil) {
            sharedInBloomAPIHandler = [super allocWithZone:zone];
        }
    }
    
    return sharedInBloomAPIHandler;
}

@end
