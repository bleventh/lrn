//
//  QuizViewController.m
//  lrn
//
//  Created by Brandon Leventhal on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *card;


@end

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }

   self.card.backgroundColor = [UIColor blueColor];
   UISwipeGestureRecognizer *swipe;
   swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
   swipe.direction = UISwipeGestureRecognizerDirectionLeft;
   [self.card addGestureRecognizer:swipe];
   swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
   swipe.direction = UISwipeGestureRecognizerDirectionRight;
   [self.card addGestureRecognizer:swipe];

    return self;
}

-(void)handleSwipe:(UISwipeGestureRecognizer *)gesture {
   UIViewAnimationOptions option = kNilOptions;
   option = UIViewAnimationOptionTransitionCurlDown;
   NSLog(@"touch");
   if (gesture.direction == UISwipeGestureRecognizerDirectionRight)
   {

      option = UIViewAnimationOptionTransitionCurlDown;

   }
   else if (gesture.direction == UISwipeGestureRecognizerDirectionLeft)
   {
      option = UIViewAnimationOptionTransitionCurlUp;
   }

   [UIView transitionWithView:self.view
                     duration:1
                      options:option
                   animations:^{
                      //self.imageView.image = [UIImage imageWithContentsOfFile:self.imageNames[self.imageIndex]];
                      self.card.backgroundColor = [UIColor redColor];
                   }
                   completion:nil];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
