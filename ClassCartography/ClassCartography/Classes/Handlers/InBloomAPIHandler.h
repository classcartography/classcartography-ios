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
- (void)getSectionsComplete;
- (void)getStudentsComplete:(NSMutableArray *)arr;
@end

@protocol InBloomAPIHandlerStudentDelegate
- (void)getInterventionsComplete:(NSMutableArray *)arr;
@end

@interface InBloomAPIHandler : NSObject {
    
    __unsafe_unretained id <InBloomAPIHandlerDelegate> delegate;
    __unsafe_unretained id <InBloomAPIHandlerStudentDelegate> studentDelegate;
    NSString *token;
    
@private
    AFHTTPClient *_httpClient;
}

+ (InBloomAPIHandler *)sharedInBloomAPIHandler;

@property (nonatomic, assign) id <InBloomAPIHandlerDelegate> delegate;
@property (nonatomic, assign) id <InBloomAPIHandlerStudentDelegate> studentDelegate;
@property (nonatomic, copy) NSString *token;

- (void)authenticate:(UIViewController *)viewController;
- (void)saveSession:(NSString *)authorizationCode;
- (BOOL)isSessionValid;
- (void)getStudentsInfoForSection:(NSString *)sectionId;
- (void)getInterventionsInfoForStudent:(NSString *)studentId;
- (void)saveIntervention:(NSDictionary *)d forStudent:(NSString *)studentId;

@end

