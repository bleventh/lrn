//
//  StudentViewController.m
//  lrn
//
//  Created by Scott Vanderlind on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "StudentViewController.h"
#import "StudentQuizResultCell.h"
#import "HorizontalRosterTableCell.h"
#import "Deck.h"
#import "ClassSch.h"

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
    [self.rosterTable setSeparatorColor:[UIColor whiteColor]];
    
	// Do any additional setup after loading the view.
   
    [self updateStudentView];
}

- (void)updateStudentView
{
    self.title = self.studentName.text = [NSString stringWithFormat:@"%@ %@", self.student.firstName, self.student.lastName];
    
    //NSLog(@"student %@\n", self.student);
    
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
    if (tableView == self.quizTable) {
        return 10;
    } else {
        return [[self.student.relationship.students allObjects] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.quizTable) {
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
    } else {
        HorizontalRosterTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HorizontalRoster"];
        //cell.textLabel.text = @"Hello!";
        
        CALayer *l = [cell.studentImage layer];
        [l setMasksToBounds:YES];
        [l setCornerRadius:55];
        
        //ClassSch *c = self.student.relationship;
        Student *s = [[self.student.relationship.students allObjects] objectAtIndex:indexPath.row];
        cell.studentName.text = s.firstName; //[NSString stringWithFormat:@"%@ %@", s.firstName, s.lastName];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (tableView == self.quizTable) {
        
    } else {
        // This is where we get the name of the class and switch to appropriate view
        self.student = [[self.student.relationship.students allObjects] objectAtIndex:indexPath.row];
        [self updateStudentView];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
