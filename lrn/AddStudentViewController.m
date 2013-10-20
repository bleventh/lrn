//
//  AddStudentViewController.m
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "AddStudentViewController.h"
#import "AppDelegate.h"
#import "Student.h"
#import "ClassSch.h"
#import "AppStateInfo.h"

@interface AddStudentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *studentFirstName;
@property (weak, nonatomic) IBOutlet UITextField *studentLastName;
@property (weak, nonatomic) IBOutlet UITextField *parentFirstName;
@property (weak, nonatomic) IBOutlet UITextField *parentLastName;
@property (weak, nonatomic) IBOutlet UITextField *parentEmail;

@end

@implementation AddStudentViewController

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
   self.studentLastName.delegate = self;
   self.studentFirstName.delegate = self;
   self.parentEmail.delegate = self;
   self.parentFirstName.delegate = self;
   self.parentLastName.delegate = self;
   self.title = @"New Student";
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addNewStudent:(id)sender {
   AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   NSManagedObjectContext *context = [appDelegate managedObjectContext];
   Student *newStudent = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
   newStudent.firstName = self.studentFirstName.text;
   newStudent.lastName = self.studentLastName.text;
   newStudent.parentEmail = self.parentEmail.text;
   newStudent.parentFirstName = self.parentFirstName.text;
   newStudent.parentLastName = self.parentLastName.text;

   self.parentLastName.text = @"";
   self.parentFirstName.text = @"";
   self.parentEmail.text = @"";
   self.studentFirstName.text = @"";
   self.studentLastName.text = @"";

   NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
   NSEntityDescription *entity = [NSEntityDescription entityForName:@"ClassSch"
                                             inManagedObjectContext:context];
   [fetchRequest setEntity:entity];
   ClassSch *classForNewStudent;
   NSError *error = nil;
   NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
   for (ClassSch *class in fetchedObjects) {
      if ([class.name isEqualToString:[AppStateInfo getCurrentClass]]) {
         classForNewStudent = class;
      }
   }

   [classForNewStudent addStudentsObject:newStudent];

   [context save:&error];

   
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
   [textField resignFirstResponder];

   return YES;
}

@end
