//
//  RosterViewController.m
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "RosterViewController.h"
#import "StudentCollectionViewCell.h"
#import "DeckBuilderViewController.h"
#import "StudentViewController.h"
#import "AddStudentViewController.h"
#import "AppStateInfo.h"
#import "AppDelegate.h"
#import "Student.h"
#import "Deck.h"
#import "ClassSch.h"
#import "bouncyCollectionLayout.h"

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
   self.studentCollection.collectionViewLayout = [[bouncyCollectionLayout alloc] init];
   [self.studentCollection reloadData];
    self.studentCollection.backgroundColor = [UIColor whiteColor];
    self.title = self.thisClass.name;
   [AppStateInfo setCurrentClass:self.thisClass.name];
   // NSLog(@"This is class %@\n", self.thisClass);
    
    //self.students = [self.thisClass.students allObjects];
    //NSLog(@"This has students %@\n", [self.thisClass.students allObjects]);
    /*
    for (Student *student in self.thisClass.students) {
        NSLog([NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName]);
    }
     */
    
    [self createDeckIfNone];
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
    if (self.rosterSwitch.selectedSegmentIndex == 0) {
        return [[self.thisClass.students allObjects] count];
    } else {
        return [[self.thisClass.decks allObjects] count] + 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StudentCollectionViewCell *studentCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"studentCell" forIndexPath:indexPath];
    CALayer *l = [studentCell.studentImage layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:63.5];
    
    if (self.rosterSwitch.selectedSegmentIndex == 0) {
        Student *thisOne = [[self.thisClass.students allObjects] objectAtIndex:indexPath.row];
        studentCell.studentName.text = [NSString stringWithFormat:@"%@ %@", thisOne.firstName, thisOne.lastName];
    } else {
        if (indexPath.row == [[self.thisClass.decks allObjects] count]) {
            studentCell.studentName.text = @"New deck...";
        } else {
            Deck *thisOne = [[self.thisClass.decks allObjects] objectAtIndex:indexPath.row];
            studentCell.studentName.text = thisOne.name;
        }
    }
    
    return studentCell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selected = indexPath;
    if (self.rosterSwitch.selectedSegmentIndex == 0) {
        [self performSegueWithIdentifier:@"studentSelected" sender:self];
    } else {
        if ( [[self.thisClass.decks allObjects] count] > self.selected.row ) {
            [self performSegueWithIdentifier:@"deckSelected" sender:self];
        } else {
            // We need a new one.
            NSLog(@"Add button was pressed..\n");
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New deck"
                                                            message:@"Type a name for your new deck..."
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
            
            alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            
            [alert show];
            
        }
    }
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    self.selected = NULL;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 1) {
        NSString *deckName = [[alertView textFieldAtIndex:0] text];
        //NSLog(@"TextField contents:%@",[[alertView textFieldAtIndex:0] text]);
        
        
        AppDelegate *ad = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [ad managedObjectContext];
        
        Deck *adeck = [NSEntityDescription insertNewObjectForEntityForName:@"Deck" inManagedObjectContext:context];
        adeck.name = deckName;
        adeck.id = @(1);
        
        [self.thisClass addDecksObject:adeck];
        
        NSError *error = nil;
        if ([context save:&error]) {
            NSLog(@"The save was successful!");
        } else {
            NSLog(@"The save wasn't successful: %@", [error userInfo]);
        }
        
        [self.studentCollection reloadData];
        
    }
    // [[alertView textFieldAtIndex:0] text]
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Let's only assume we're going to segue to the roster view if we
    // have a destination selected.
    if (self.selected && [segue.identifier isEqualToString:@"studentSelected"]) {
        StudentViewController *cv = segue.destinationViewController;
        cv.student = [[self.thisClass.students allObjects] objectAtIndex:self.selected.row];
        self.selected = NULL;
    } else if (self.selected && [segue.identifier isEqualToString:@"deckSelected"]) {
        DeckBuilderViewController *dbv = segue.destinationViewController;
        
        if ([[self.thisClass.decks allObjects] count] > self.selected.row) {
            // It exists.
            NSLog(@"It exists already.\n");
            dbv.thisDeck = [[self.thisClass.decks allObjects] objectAtIndex:self.selected.row];
        }
        
        //self.selected = NULL;
    }
}

- (void)viewWillAppear:(BOOL)animated {

   [self.studentCollection reloadData];
}

- (IBAction)rosterSwitchChanged:(id)sender {
    [self.studentCollection reloadData];
}

- (void)createDeckIfNone
{
    if (![[self.thisClass.decks allObjects] count]) {
        // There isn't a deck.
        NSLog(@"No deck!");
        
      
        AppDelegate *ad = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [ad managedObjectContext];
        
        Deck *adeck = [NSEntityDescription insertNewObjectForEntityForName:@"Deck" inManagedObjectContext:context];
        adeck.name = @"Poké-deck";
        adeck.id = @(1);
        
        
        [self.thisClass addDecksObject:adeck];
        
        NSError *error = nil;
        if ([context save:&error]) {
            NSLog(@"The save was successful!");
        } else {
            NSLog(@"The save wasn't successful: %@", [error userInfo]);
        }
    } else {
        NSLog(@"There is at least one deck. Cool.");
    }
}

@end
