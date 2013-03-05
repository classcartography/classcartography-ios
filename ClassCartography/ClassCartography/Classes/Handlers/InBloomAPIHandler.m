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
@synthesize token;


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
#pragma mark private methods

- (void)getClasses:(NSString *)classesUrl {
    [_httpClient getPath:classesUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        NSArray *classesResponse = [json objectWithString:operation.responseString];
        for(NSDictionary *d in classesResponse) {
            [[UserHandler sharedUserHandler].classes addObject:d];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

- (void)getClassesInfo {
    [_httpClient getPath:@"/api/rest/v1.1/home" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        
        NSDictionary *home = [json objectWithString:operation.responseString];
        NSString *classesUrl;
        NSArray *arr = [NSArray arrayWithArray:[home objectForKey:@"links"]];
        for (NSDictionary *d in arr) {
            if ([((NSString *)[d objectForKey:@"rel"]) isEqualToString:@"getSections"]) {
                classesUrl = [d objectForKey:@"href"];
            }
        }
        
        [self getClasses:classesUrl];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}


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
        token = [NSString stringWithFormat:@"Bearer %@", [d objectForKey:@"access_token"]];
        
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:INBLOOM_TOKEN];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self isSessionValid];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

- (BOOL)isSessionValid {
    [_httpClient setDefaultHeader:@"Authorization" value:token];
    [_httpClient getPath:@"/api/rest/system/session/check" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        NSDictionary *d = [json objectWithString:operation.responseString];
        
        if ([d valueForKey:@"authenticated"] == [NSNumber numberWithBool:YES]) {
            [UserHandler sharedUserHandler].isLoggedIn = YES;
            [UserHandler sharedUserHandler].name = [d objectForKey:@"full_name"];
            [self getClassesInfo];
            if (delegate)
                [delegate loginComplete];
        } else {
            [UserHandler sharedUserHandler].isLoggedIn = NO;
            [_httpClient clearAuthorizationHeader];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
    
    return [UserHandler sharedUserHandler].isLoggedIn;
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
