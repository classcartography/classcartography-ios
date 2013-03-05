//
//  InBloomAPIHandler.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/4/13.
//
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

#define INBLOOM_TOKEN @"AccessToken"


@protocol InBloomAPIHandlerDelegate
- (void)loginComplete;
@end

@interface InBloomAPIHandler : NSObject {
    
    __unsafe_unretained id <InBloomAPIHandlerDelegate> delegate;
    NSString *token;
    
@private
    AFHTTPClient *_httpClient;
}

+ (InBloomAPIHandler *)sharedInBloomAPIHandler;

@property (nonatomic, assign) id <InBloomAPIHandlerDelegate> delegate;
@property (nonatomic, copy) NSString *token;

- (void)authenticate:(UIViewController *)viewController;
- (void)saveSession:(NSString *)authorizationCode;
- (BOOL)isSessionValid;

@end

