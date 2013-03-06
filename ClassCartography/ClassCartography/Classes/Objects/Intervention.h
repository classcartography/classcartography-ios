//
//  Intervention.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import <Foundation/Foundation.h>


@interface Intervention : NSObject {
    
    int interventionId;
    NSString *dateTime;
    NSString *comment;
}

@property (nonatomic, assign) int interventionId;
@property (nonatomic, copy) NSString *dateTime;
@property (nonatomic, copy) NSString *comment;

+ (id)generate:(NSDictionary *)d;
- (void)buildFromDictionary:(NSDictionary *)d;

@end
