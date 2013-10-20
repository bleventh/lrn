//
//  StudentQuizResultCell.h
//  lrn
//
//  Created by Scott Vanderlind on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentQuizResultCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *quizName;
@property (weak, nonatomic) IBOutlet UIProgressView *quizProgress;
@property (weak, nonatomic) IBOutlet UILabel *quizPercent;

@end
