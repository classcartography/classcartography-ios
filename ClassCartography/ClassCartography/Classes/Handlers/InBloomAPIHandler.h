//
//  InBloomAPIHandler.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/4/13.
//
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"


@interface InBloomAPIHandler : NSObject {
    
@private
    AFHTTPClient *_httpClient;
}

+ (InBloomAPIHandler *)sharedInBloomAPIHandler;

- (void)authenticate:(UIViewController *)viewController;
- (void)saveSession:(NSString *)authorizationCode;

@end

