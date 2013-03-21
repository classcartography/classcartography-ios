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
#import "Intervention.h"
#import "SBJson.h"
#import "Section.h"
#import "Student.h"
#import "WebViewController.h"
#import "UserHandler.h"


static InBloomAPIHandler *sharedInBloomAPIHandler;

@implementation InBloomAPIHandler

@synthesize delegate;
@synthesize studentDelegate;
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

- (void)getSectionsInfo {
    [_httpClient getPath:@"/api/rest/v1.1/home" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        
        NSDictionary *home = [json objectWithString:operation.responseString];
        NSString *sectionsUrl;
        NSArray *arr = [NSArray arrayWithArray:[home objectForKey:@"links"]];
        for (NSDictionary *d in arr) {
            if ([((NSString *)[d objectForKey:@"rel"]) isEqualToString:@"getSections"]) {
                sectionsUrl = [d objectForKey:@"href"];
            }
        }
        
        [self getSections:sectionsUrl];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

- (void)getSections:(NSString *)sectionsUrl {
    [_httpClient getPath:sectionsUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        NSArray *sectionsResponse = [json objectWithString:operation.responseString];
        for(NSDictionary *d in sectionsResponse) {
            [Section generate:d];
            [[UserHandler sharedUserHandler].user.sections addObject:[Section generate:d]];
        }
        [delegate getSectionsComplete];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

- (void)getStudents:(NSString *)studentsUrl {
    [_httpClient getPath:studentsUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        NSArray *studentsResponse = [json objectWithString:operation.responseString];
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
        for(NSDictionary *d in studentsResponse) {
            [arr addObject:[Student generate:d]];
        }
        [delegate getStudentsComplete:arr];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

- (void)getInterventions:(NSString *)interventionsUrl {
    [_httpClient getPath:interventionsUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        NSArray *interventionsResponse = [json objectWithString:operation.responseString];
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
        for(NSDictionary *d in interventionsResponse) {
            [arr addObject:[Intervention generate:d]];
        }
        [studentDelegate getInterventionsComplete:arr];
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
            [UserHandler sharedUserHandler].user.name = [d objectForKey:@"full_name"];
            [self getSectionsInfo];
            
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

- (void)getStudentsInfoForSection:(NSString *)sectionId {
    [_httpClient getPath:[NSString stringWithFormat:@"/api/rest/v1.1/sections/%@", sectionId] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        
        NSDictionary *section = [json objectWithString:operation.responseString];
        NSString *studentsUrl;
        NSArray *arr = [NSArray arrayWithArray:[section objectForKey:@"links"]];
        for (NSDictionary *d in arr) {
            if ([((NSString *)[d objectForKey:@"rel"]) isEqualToString:@"getStudents"]) {
                studentsUrl = [d objectForKey:@"href"];
            }
        }
        
        [self getStudents:studentsUrl];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

- (void)getInterventionsInfoForStudent:(NSString *)studentId {
    [_httpClient getPath:[NSString stringWithFormat:@"/api/rest/v1.1/students/%@", studentId] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        
        NSDictionary *student = [json objectWithString:operation.responseString];
        NSString *customUrl;
        NSArray *arr = [NSArray arrayWithArray:[student objectForKey:@"links"]];
        for (NSDictionary *d in arr) {
            if ([((NSString *)[d objectForKey:@"rel"]) isEqualToString:@"custom"]) {
                customUrl = [d objectForKey:@"href"];
            }
        }
        
        [self getInterventions:customUrl];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

- (void)saveIntervention:(NSDictionary *)d forStudent:(NSString *)studentId {
    [_httpClient setParameterEncoding:AFJSONParameterEncoding];
    [_httpClient requestWithMethod:@"POST"
                              path:@"/api/rest/v1.1/students/%@/custom"
                        parameters:d];
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
