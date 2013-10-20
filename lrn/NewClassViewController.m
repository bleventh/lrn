//
//  NewClassViewController.m
//  lrn
//
//  Created by Brandon Leventhal on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "NewClassViewController.h"
#import "AppDelegate.h"
#import "ClassSch.h"

@interface NewClassViewController ()
@property (weak, nonatomic) IBOutlet UITextField *classNameTextField;

@end

@implementation NewClassViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.classNameTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addNewClass:(id)sender {
   AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   NSManagedObjectContext *context = [appDelegate managedObjectContext];
   ClassSch *newClass = [NSEntityDescription insertNewObjectForEntityForName:@"ClassSch" inManagedObjectContext:context];
   newClass.name = self.classNameTextField.text;
   NSError *error = nil;

   [context save:&error];
   if (error) {
      NSLog(@"%@", [error userInfo]);
   }
   self.classNameTextField.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
   [textField resignFirstResponder];
   return YES;
}



@end
