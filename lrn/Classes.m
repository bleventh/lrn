//
//  Classes.m
//  lrn
//
//  Created by Brandon Leventhal on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "Classes.h"
#import "AppDelegate.h"
#import "ClassSch.h"

@interface Classes ()

@end

@implementation Classes

-(id)initWithStyle:(UITableViewStyle)style
{

   if ([super initWithStyle:style] != nil) {

      AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
      NSManagedObjectContext *context = [appDelegate managedObjectContext];

      NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
      NSEntityDescription *entity = [NSEntityDescription entityForName:@"ClassSch"
                                                inManagedObjectContext:context];
      [fetchRequest setEntity:entity];
      NSError *error = nil;
      NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];

      self.classes = [NSMutableArray array];

      for (ClassSch *class in fetchedObjects) {
         [self.classes addObject:class.name];
      }

      //Make row selections persist.
      self.clearsSelectionOnViewWillAppear = NO;
   }

   //Calculate how tall the view should be by multiplying
   //the individual row height by the total number of rows.
   NSInteger rowsCount = [self.classes count];
   NSInteger singleRowHeight = [self.tableView.delegate tableView:self.tableView
                                          heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
   NSInteger totalRowsHeight = rowsCount * singleRowHeight;

   //Calculate how wide the view should be by finding how
   //wide each string is expected to be
   CGFloat largestLabelWidth = 0;
   for (NSString *class in self.classes) {
      //Checks size of text using the default font for UITableViewCell's textLabel.

      CGSize labelSize = [class sizeWithAttributes:@{@"Font": [UIFont boldSystemFontOfSize:20.0f]}];
      if (labelSize.width > largestLabelWidth) {
         largestLabelWidth = labelSize.width;
      }
   }

   //Add a little padding to the width
   CGFloat popoverWidth = largestLabelWidth + 100;

   //Set the property to tell the popover container how big this view will be.
   self.preferredContentSize = CGSizeMake(popoverWidth, totalRowsHeight);

   return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.classes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *CellIdentifier = @"Cell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
   }

   // Configure the cell...
   cell.textLabel.text = [self.classes objectAtIndex:indexPath.row];

   return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSString *selectedClassName = [self.classes objectAtIndex:indexPath.row];
   if(self.delegate != nil) {
      [self.delegate selectedClass:selectedClassName];
   }
  // This is where we get the name of the class and switch to appropriate view
}

@end
