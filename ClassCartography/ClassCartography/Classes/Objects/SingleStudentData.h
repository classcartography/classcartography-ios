//
//  SingleStudentData.h
//  ClassCartography
//
//  Created by Paul Lee on 3/6/13.
//
//

#import <Foundation/Foundation.h>

@interface SingleStudentData : NSObject

@property (nonatomic) NSMutableDictionary *interventionData;
@property (nonatomic) NSMutableDictionary *gradeData;
@property (nonatomic) NSMutableArray *interventionDays;
@property (nonatomic) NSMutableArray *gradeDays;

@end
