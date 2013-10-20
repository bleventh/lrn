//
//  DeckQuizViewController.m
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "DeckQuizViewController.h"

@interface DeckQuizViewController ()

@end

@implementation DeckQuizViewController

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
    NSLog(@"I am %@ and my deck is %@\n", self.thisStudent.firstName, self.thisDeck.name);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
