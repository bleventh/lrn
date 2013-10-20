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

@interface EntryPointViewController ()
@property (weak, nonatomic) IBOutlet UITableView *classPickTableView;

@property (weak, nonatomic) NSArray * classes;
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


   AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   NSManagedObjectContext *context = [appDelegate managedObjectContext];

   NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
   NSEntityDescription *entity = [NSEntityDescription entityForName:@"ClassSch"
                                             inManagedObjectContext:context];
   [fetchRequest setEntity:entity];
   NSError *error = nil;
   NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];


   self.classes = fetchedObjects;

   self.classPickTableView.delegate = self;
   self.classPickTableView.dataSource = self;

   const CGFloat k90DegreesCounterClockwiseAngle = (CGFloat) -(90 * M_PI / 180.0);

   CGRect frame = self.classPickTableView.frame;
   self.classPickTableView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, k90DegreesCounterClockwiseAngle);
   self.classPickTableView.frame = frame;
   [self.classPickTableView setShowsHorizontalScrollIndicator:NO];
   [self.classPickTableView setShowsVerticalScrollIndicator:NO];

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
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *CellIdentifier = @"horizontalCell";

   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

   if (cell == nil)
   {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
   }

   cell.textLabel.text = @"";

   return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

   const float kHardCodedRowHeight = 150.0f;
   return kHardCodedRowHeight;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
