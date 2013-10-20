//
//  HorizontalClassCell.h
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassSch.h"

@interface HorizontalClassCell : UITableViewCell

@property (nonatomic, weak) ClassSch *thisClass;
@property (weak, nonatomic) IBOutlet UIImageView *classImage;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;

@end
