//
//  StudentViewController.h
//  lrn
//
//  Created by Scott Vanderlind on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "HorizonalTableView.h"

@interface StudentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *studentImage;
@property (weak, nonatomic) IBOutlet UILabel *studentName;
@property (weak, nonatomic) IBOutlet UITableView *quizTable;
@property (weak, nonatomic) IBOutlet HorizonalTableView *rosterTable;
@property (weak, nonatomic) IBOutlet UILabel *parentInfo;

@property (weak, nonatomic) Student *student;

@end
