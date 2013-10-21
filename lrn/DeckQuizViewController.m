//
//  DeckQuizViewController.m
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "DeckQuizViewController.h"
#import "Card.h"

@interface DeckQuizViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cardLabel;
@property int index;

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
   self.index = 0;
   self.cardLabel.text = ((Card *)[[self.thisDeck.cards allObjects] objectAtIndex:self.index]).text;

	// Do any additional setup after loading the view.
    NSLog(@"I am %@ and my deck is %@\n", self.thisStudent.firstName, self.thisDeck.name);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextCard:(id)sender {
   ++self.index;
   if (self.index >= [[self.thisDeck.cards allObjects] count]) {
      self.cardLabel.text = @"Deck Empty!";
      return;
   }

   CGPoint offset = CGPointMake( self.cardLabel.center.x, [UIScreen mainScreen].bounds.size.height);
   [UIView animateWithDuration:0.5 animations:^{
      self.cardLabel.center = offset;
   }];
   self.cardLabel.text = ((Card *)[[self.thisDeck.cards allObjects] objectAtIndex:self.index]).text;
   offset = CGPointMake( [UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2);
   [UIView animateWithDuration:0.5 animations:^{
      self.cardLabel.center = offset;
   }];
}
- (IBAction)nextCard1:(id)sender {
      ++self.index;
   if (self.index >= [[self.thisDeck.cards allObjects] count]) {
      self.cardLabel.text = @"Deck Empty!";
      return;
   }
   CGPoint offset = CGPointMake( self.cardLabel.center.x, [UIScreen mainScreen].bounds.size.height);
   [UIView animateWithDuration:0.5 animations:^{
      self.cardLabel.center = offset;
   }];
   self.cardLabel.text = ((Card *)[[self.thisDeck.cards allObjects] objectAtIndex:self.index]).text;
   offset = CGPointMake( [UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2);
   [UIView animateWithDuration:0.5 animations:^{
      self.cardLabel.center = offset;
   }];
}

@end
