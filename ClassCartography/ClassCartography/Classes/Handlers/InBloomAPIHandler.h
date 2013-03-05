//
//  InBloomAPIHandler.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/4/13.
//
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"


@protocol InBloomAPIHandlerConnectionDelegate
- (void)continueLogin;
@end

@interface InBloomAPIHandler : NSObject {
    
    __unsafe_unretained id <InBloomAPIHandlerConnectionDelegate> connectionDelegate;
    
@private
    AFHTTPClient *_httpClient;
}

+ (InBloomAPIHandler *)sharedInBloomAPIHandler;

@property (nonatomic, assign) id <InBloomAPIHandlerConnectionDelegate> connectionDelegate;

- (void)authenticate;

@end

