//
//  EntryPointViewController.m
//  lrn
//
//  Created by Brandon Leventhal on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "EntryPointViewController.h"
#import "ClassSch.h"
#import "AppDelegate.h"
#import "RosterViewController.h"
#import "HorizontalTableCell.h"
#import "HorizonalTableView.h"
#import "HorizontalClassCell.h"


@interface EntryPointViewController ()
@property (weak, nonatomic) IBOutlet  HorizonalTableView *classPickTableView;

// This is strong because we keep using it.
@property (strong, nonatomic) NSArray * classes;

// The segue destination
@property (weak, nonatomic) NSIndexPath *selected;
@end

@implementation EntryPointViewController

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

   self.classPickTableView.delegate = self;
   self.classPickTableView.dataSource = self;
    
    //self.navigationController.toolbarHidden = YES;
    

}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
   AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   NSManagedObjectContext *context = [appDelegate managedObjectContext];

   NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
   NSEntityDescription *entity = [NSEntityDescription entityForName:@"ClassSch"
                                             inManagedObjectContext:context];
   [fetchRequest setEntity:entity];
   //[fetchRequest valueForKey:@"students"];
   NSError *error = nil;
   NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];

   self.classes = fetchedObjects;

   [self.classPickTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

   // Return the number of sections.
   return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

   // Return the number of rows in the section.
   return [self.classes count] + 1;
    //return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"classCell";

    HorizontalClassCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ([self.classes count] == indexPath.row) {
        cell.classLabel.text = @"New class...";
        [cell.classImage setImage:[UIImage imageNamed:@"new_creator.png"]];
    } else {
        ClassSch *class = [self.classes objectAtIndex:indexPath.row];
        cell.classLabel.text = class.name;
        cell.thisClass = class;
        [cell.classImage setImage:[UIImage imageNamed:@"user.png"]];
    }
    //NSLog(@"Class %@\n", class);
    
    CALayer *l = [cell.classImage layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:80];

    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

   const float kHardCodedRowHeight = 300.0f;
   return kHardCodedRowHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // This is where we get the name of the class and switch to appropriate view
    self.selected = indexPath;
    //NSLog(@"Index is %ld\n", (long)self.selected.row);
    if ([self.classes count] == indexPath.row) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New class"
                                                        message:@"Type a name for your new class..."
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Ok", nil];
        
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alert show];
    } else {
        [self performSegueWithIdentifier:@"classSelected" sender:self];
    }
    
    self.selected = NULL;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 1) {
        NSString *className = [[alertView textFieldAtIndex:0] text];
        //NSLog(@"TextField contents:%@",[[alertView textFieldAtIndex:0] text]);
        
        
        AppDelegate *ad = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [ad managedObjectContext];
        
        ClassSch *aclass = [NSEntityDescription insertNewObjectForEntityForName:@"ClassSch" inManagedObjectContext:context];
        aclass.name = className;
        aclass.id = @(1);
        
        //[self.class addDecksObject:adeck];
        //self.
        
        NSError *error = nil;
        if ([context save:&error]) {
            NSLog(@"The save was successful!");
        } else {
            NSLog(@"The save wasn't successful: %@", [error userInfo]);
        }
        
        //[self.classPickTableView reloadData];
        [self viewWillAppear:YES];
        
    }
    // [[alertView textFieldAtIndex:0] text]
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Let's only assume we're going to segue to the roster view if we
    // have a destination selected.
    if (self.selected) {
        RosterViewController *cv = segue.destinationViewController;
        cv.thisClass = [self.classes objectAtIndex:self.selected.row];
        self.navigationController.navigationBar.hidden = NO;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
