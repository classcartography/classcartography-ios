//
//  Student.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import "Student.h"


@implementation Student

@synthesize studentId;
@synthesize firstName;
@synthesize middleName;
@synthesize lastName;
@synthesize suffix;
@synthesize gender;
@synthesize imageName;
@synthesize interventions;

- (id)init {
    if (self = [super init]) {
        interventions = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
	Student *studentCopy = [[[self class] allocWithZone:zone] init];
	
    [studentCopy setStudentId:studentId];
    [studentCopy setFirstName:firstName];
    [studentCopy setMiddleName:middleName];
    [studentCopy setLastName:lastName];
    [studentCopy setSuffix:suffix];
    [studentCopy setGender:gender];
    [studentCopy setImageName:imageName];
    [studentCopy setInterventions:interventions];
	
    return studentCopy;
}


#pragma mark -
#pragma mark class methods

+ (id)generate:(NSDictionary *)d {
    Student *student = [[Student alloc] init];
    [student buildFromDictionary:d];
    
    return student;
}

#pragma mark -
#pragma mark public methods

- (void)buildFromDictionary:(NSDictionary *)d {
    studentId = [[d objectForKey:@"id"] copy];
    firstName = [[[d objectForKey:@"name"] objectForKey:@"firstName"] copy];
    middleName = [[[d objectForKey:@"name"] objectForKey:@"middleName"] copy];
    lastName =[[[d objectForKey:@"name"] objectForKey:@"lastSurname"] copy];
    suffix = [[[d objectForKey:@"name"] objectForKey:@"generationCodeSuffix"] copy];
    gender = [[d objectForKey:@"sex"] copy];
    
    if ([gender isEqualToString:@"Female"]) {
        imageName = [NSString stringWithFormat:@"female-%d.jpg", arc4random_uniform(4)];
    }
    
    if ([gender isEqualToString:@"Male"]) {
        imageName = [NSString stringWithFormat:@"male-%d.jpg", arc4random_uniform(3)];
    }
}

@end
