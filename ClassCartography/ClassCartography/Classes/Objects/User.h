//
//  User.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import <Foundation/Foundation.h>


@interface User : NSObject {
    
    NSString *name;
    NSMutableArray *sections;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSMutableArray *sections;

@end
