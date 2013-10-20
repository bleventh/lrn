//
//  DeckBuilderViewController.h
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "ViewController.h"
#import "HorizonalTableView.h"
#import "Deck.h"
#import "Card.h"

@interface DeckBuilderViewController : ViewController
@property (weak, nonatomic) IBOutlet UIImageView *cardImage;
@property (weak, nonatomic) IBOutlet UILabel *cardText;
@property (weak, nonatomic) IBOutlet UIButton *saveCard;
@property (weak, nonatomic) IBOutlet HorizonalTableView *deckTable;
@property (weak, nonatomic) IBOutlet UITextField *cardTextBox;
- (IBAction)saveCard:(id)sender;

@property (weak, nonatomic) Deck *thisDeck;

@end
