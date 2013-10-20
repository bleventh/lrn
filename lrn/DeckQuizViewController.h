//
//  DeckQuizViewController.h
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Deck.h"

@interface DeckQuizViewController : ViewController

@property (weak, nonatomic) Student *thisStudent;
@property (weak, nonatomic) Deck *thisDeck;

@end
