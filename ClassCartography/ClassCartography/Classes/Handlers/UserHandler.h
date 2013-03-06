//
//  UserHandler.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/4/13.
//
//

#import <Foundation/Foundation.h>
#import "User.h"


@interface UserHandler : NSObject {
    
    BOOL isLoggedIn;
    User *user;
}

@property (nonatomic, assign) BOOL isLoggedIn;
@property (nonatomic, retain) User *user;

+ (UserHandler *)sharedUserHandler;

@end
