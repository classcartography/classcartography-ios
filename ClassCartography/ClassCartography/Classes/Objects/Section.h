//
//  Section.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import <Foundation/Foundation.h>


@interface Section : NSObject <NSCopying> {
    
    NSString *sectionId;
    NSString *name;
    NSMutableArray *students;
}

@property (nonatomic, copy) NSString *sectionId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSMutableArray *students;

+ (id)generate:(NSDictionary *)d;
- (void)buildFromDictionary:(NSDictionary *)d;


@end
