//
//  UserHandler.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/4/13.
//
//

#import <Foundation/Foundation.h>


@interface UserHandler : NSObject {
    
    BOOL isLoggedIn;
    NSString *token;
}

@property (nonatomic, assign) BOOL isLoggedIn;
@property (nonatomic, copy) NSString *token;

+ (UserHandler *)sharedUserHandler;

@end
