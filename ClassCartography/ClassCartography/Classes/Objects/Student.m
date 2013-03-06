//
//  Student.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/6/13.
//
//

#import "Student.h"


@implementation Student

@synthesize firstName;
@synthesize middleName;
@synthesize lastName;
@synthesize suffix;
@synthesize imageName;

- (id)init {
    if (self = [super init]) { }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
	Student *studentCopy = [[[self class] allocWithZone:zone] init];
	
    [studentCopy setFirstName:firstName];
    [studentCopy setMiddleName:middleName];
    [studentCopy setLastName:lastName];
    [studentCopy setSuffix:suffix];
    [studentCopy setImageName:imageName];
	
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
    firstName = [[[d objectForKey:@"name"] objectForKey:@"firstName"] copy];
    middleName = [[[d objectForKey:@"name"] objectForKey:@"middleName"] copy];
    lastName =[[[d objectForKey:@"name"] objectForKey:@"lastSurname"] copy];
    suffix = [[[d objectForKey:@"name"] objectForKey:@"generationCodeSuffix"] copy];
}

@end
