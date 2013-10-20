//
//  DeckBuilderViewController.m
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "DeckBuilderViewController.h"
#import "HorizontalRosterTableCell.h"

@interface DeckBuilderViewController ()

@end

@implementation DeckBuilderViewController

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
    self.title = self.thisDeck.name;
    
    CALayer *l = [self.cardImage layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:131.5];
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
    return [[self.thisDeck.cards allObjects] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    HorizontalRosterTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HorizontalRoster"];

    CALayer *l = [cell.studentImage layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:55];

    //ClassSch *c = self.student.relationship;
    Card *s = [[self.thisDeck.cards allObjects] objectAtIndex:indexPath.row];
    cell.studentName.text = s.text;

    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (IBAction)saveCard:(id)sender {
    
}
@end
