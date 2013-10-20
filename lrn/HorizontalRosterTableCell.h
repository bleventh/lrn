//
//  HorizontalRosterTableCell.h
//  lrn
//
//  Created by Scott Vanderlind on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalRosterTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *studentImage;
@property (weak, nonatomic) IBOutlet UILabel *studentName;

@end
