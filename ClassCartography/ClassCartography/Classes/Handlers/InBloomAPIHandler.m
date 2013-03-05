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
#import "SBJson.h"
#import "WebViewController.h"
#import "UserHandler.h"


static InBloomAPIHandler *sharedInBloomAPIHandler;

@implementation InBloomAPIHandler

@synthesize delegate;


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

- (void)authenticate:(UIViewController *)viewController {
    NSString *authUrl = [NSString stringWithFormat:@"%@/api/oauth/authorize?client_id=%@&response_type=code", INBLOOM_API_ROOT, INBLOOM_CLIENT_ID];WebViewController *webViewController = [[WebViewController alloc] init];
    [viewController presentViewController:webViewController animated:YES completion:nil];
    [webViewController loadRequest:authUrl];
}

- (void)saveSession:(NSString *)authorizationCode {
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:INBLOOM_CLIENT_ID, @"client_id", INBLOOM_SHARED_SECRET, @"client_secret", authorizationCode, @"code", @"", @"redirect_uri", nil];
    [_httpClient getPath:@"/api/oauth/token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        NSDictionary *d = [json objectWithString:operation.responseString];
        
        [UserHandler sharedUserHandler].isLoggedIn = YES;
        [UserHandler sharedUserHandler].token = [d objectForKey:@"access_token"];
        
        [delegate loginComplete];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
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
