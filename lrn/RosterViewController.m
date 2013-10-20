//
//  RosterViewController.m
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "RosterViewController.h"
#import "StudentCollectionViewCell.h"
#import "StudentViewController.h"

@interface RosterViewController ()

@end

@implementation RosterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.studentCollection.backgroundColor = [UIColor whiteColor];
    self.title = self.thisClass.name;
   // NSLog(@"This is class %@\n", self.thisClass);
    
    //self.students = [self.thisClass.students allObjects];
    //NSLog(@"This has students %@\n", [self.thisClass.students allObjects]);
    /*
    for (Student *student in self.thisClass.students) {
        NSLog([NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName]);
    }
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addStudent:(id)sender {
}

// Collection

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    
    return [[self.thisClass.students allObjects] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StudentCollectionViewCell *studentCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"studentCell" forIndexPath:indexPath];
    CALayer *l = [studentCell.studentImage layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:63.5];
    
    Student *thisOne = [[self.thisClass.students allObjects] objectAtIndex:indexPath.row];
    studentCell.studentName.text = [NSString stringWithFormat:@"%@ %@", thisOne.firstName, thisOne.lastName];
    return studentCell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selected = indexPath;
    [self performSegueWithIdentifier:@"studentSelected" sender:self];
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Let's only assume we're going to segue to the roster view if we
    // have a destination selected.
    if (self.selected) {
        StudentViewController *cv = segue.destinationViewController;
        cv.student = [[self.thisClass.students allObjects] objectAtIndex:self.selected.row];
        self.selected = NULL;
    }
}

@end
