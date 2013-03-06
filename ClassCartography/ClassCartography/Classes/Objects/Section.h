//
//  Section.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import <Foundation/Foundation.h>


@interface Section : NSObject <NSCopying> {
    
    NSString *name;
    NSString *lastAssignment;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *lastAssignment;

+ (id)generate:(NSDictionary *)d;
- (void)buildFromDictionary:(NSDictionary *)d;


@end
