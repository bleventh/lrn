//
//  StudentViewController.m
//  lrn
//
//  Created by Scott Vanderlind on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "StudentViewController.h"
#import "StudentQuizResultCell.h"
#import "Deck.h"

@interface StudentViewController ()

@end

@implementation StudentViewController

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
    [self.quizTable setSeparatorColor:[UIColor whiteColor]];
    
	// Do any additional setup after loading the view.
    self.title = self.studentName.text = @"Gwen Stacy";
    
    // Make the image round
    CALayer *l = [self.studentImage layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:131.5];
    
    //[self.studentImage setImage:[UIImage imageNamed:@"gwenStacy.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TABLE STUFF

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{   
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    StudentQuizResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuizOverview"];
    if (indexPath.row % 2) {
        cell.quizName.text = @"Letters"; //[[self.quizzes objectAtIndex:indexPath.row] valueForKey:@"name"];
        cell.quizProgress.progress = 0.60;
        cell.quizPercent.text = @"60%";
    } else {
        cell.quizName.text = @"Animals";
        cell.quizProgress.progress = .98;
        cell.quizPercent.text = @"98%";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    // This is where we get the name of the class and switch to appropriate view
}




@end
