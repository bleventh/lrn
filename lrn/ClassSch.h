//
//  ClassSch.h
//  lrn
//
//  Created by Brandon Leventhal on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Deck, Student;

@interface ClassSch : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *decks;
@property (nonatomic, retain) NSSet *students;
@end

@interface ClassSch (CoreDataGeneratedAccessors)

- (void)addDecksObject:(Deck *)value;
- (void)removeDecksObject:(Deck *)value;
- (void)addDecks:(NSSet *)values;
- (void)removeDecks:(NSSet *)values;

- (void)addStudentsObject:(Student *)value;
- (void)removeStudentsObject:(Student *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
