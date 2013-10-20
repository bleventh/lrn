//
//  ViewController.m
//  lrn
//
//  Created by Brandon Leventhal on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) Classes *classPicker;
@property (strong, nonatomic) UIPopoverController *classPopOver;
@end

@implementation ViewController



- (void)viewDidLoad
{
   
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)popOverMenu:(UIBarButtonItem*)sender {

   if (self.classPicker == nil) {
      //Create the ColorPickerViewController.
      self.classPicker = [[Classes alloc] initWithStyle:UITableViewStylePlain];

      //Set this VC as the delegate.
      self.classPicker.delegate = self;
   }

   if (self.classPopOver == nil) {
      //The color picker popover is not showing. Show it.
      self.classPopOver = [[UIPopoverController alloc] initWithContentViewController:self.classPicker];
      [self.classPopOver presentPopoverFromBarButtonItem:(UIBarButtonItem *)sender
                                  permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
   } else {
      //The color picker popover is showing. Hide it.
      [self.classPopOver dismissPopoverAnimated:YES];
      self.classPopOver = nil;
   }
}

-(void)selectedClass:(NSString *)class {

}

@end
