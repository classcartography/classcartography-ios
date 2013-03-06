//
//  Student.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import <Foundation/Foundation.h>


@interface Student : NSObject <NSCopying> {
    
    NSString *firstName;
    NSString *middleName;
    NSString *lastName;
    NSString *suffix;
    NSString *gender;
    NSString *imageName;
}

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *middleName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *suffix;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *imageName;

+ (id)generate:(NSDictionary *)d;
- (void)buildFromDictionary:(NSDictionary *)d;

@end
