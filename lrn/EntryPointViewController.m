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

}

- (void)viewWillAppear:(BOOL)animated {

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
   return [self.classes count];
    //return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ClassSch *class = [self.classes objectAtIndex:indexPath.row];
    
    static NSString *CellIdentifier = @"horizontalCell";

    HorizontalTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    cell.textLabel.text = class.name;
    cell.thisClass = class;
    //NSLog(@"Class %@\n", class);

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
    [self performSegueWithIdentifier:@"classSelected" sender:self];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Let's only assume we're going to segue to the roster view if we
    // have a destination selected.
    if (self.selected) {
        RosterViewController *cv = segue.destinationViewController;
        cv.thisClass = [self.classes objectAtIndex:self.selected.row];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
