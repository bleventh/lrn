//
//  RosterViewController.h
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassSch.h"
#import "Student.h"

@interface RosterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *studentCollection;
- (IBAction)addStudent:(id)sender;


@property (nonatomic, weak) ClassSch *thisClass;
@property (nonatomic, weak) NSArray *students;
@property (nonatomic, strong) NSIndexPath *selected;

@end
