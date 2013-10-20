//
//  Student.h
//  lrn
//
//  Created by Brandon Leventhal on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClassSch;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * parentEmail;
@property (nonatomic, retain) NSString * parentFirstName;
@property (nonatomic, retain) NSString * parentLastName;
@property (nonatomic, retain) NSString * parentPhone;
@property (nonatomic, retain) ClassSch *relationship;

@end
