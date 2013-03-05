//
//  InBloomAPIHandler.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/4/13.
//
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"


@protocol InBloomAPIHandlerDelegate
- (void)loginComplete;
@end

@interface InBloomAPIHandler : NSObject {
    
    __unsafe_unretained id <InBloomAPIHandlerDelegate> delegate;
    
@private
    AFHTTPClient *_httpClient;
}

+ (InBloomAPIHandler *)sharedInBloomAPIHandler;

@property (nonatomic, assign) id <InBloomAPIHandlerDelegate> delegate;

- (void)authenticate:(UIViewController *)viewController;
- (void)saveSession:(NSString *)authorizationCode;

@end

