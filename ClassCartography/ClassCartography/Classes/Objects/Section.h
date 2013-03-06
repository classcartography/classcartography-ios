//
//  Section.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import <Foundation/Foundation.h>


@interface Section : NSObject <NSCopying> {
    
    int sectionId;
    NSString *name;
    NSArray *students;
}

@property (nonatomic, assign) int sectionId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSArray *students;

+ (id)generate:(NSDictionary *)d;
- (void)buildFromDictionary:(NSDictionary *)d;


@end
