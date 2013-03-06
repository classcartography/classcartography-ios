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
    NSMutableArray *interventions;
}

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *middleName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *suffix;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, retain) NSMutableArray *interventions;

+ (id)generate:(NSDictionary *)d;
- (void)buildFromDictionary:(NSDictionary *)d;

@end
