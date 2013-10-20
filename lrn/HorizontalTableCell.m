//
//  HorizontalTableCell.m
//  lrn
//
//  Created by Brandon Leventhal on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "HorizontalTableCell.h"

@implementation HorizontalTableCell

/*- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
   assert([aDecoder isKindOfClass:[NSCoder class]]);

   self = [super initWithCoder:aDecoder];

   if (self) {

      CGFloat k90DegreesClockwiseAngle = (CGFloat) (90 * M_PI / 180.0);

      self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, k90DegreesClockwiseAngle);
   }

   assert(self);
   return self;
}






@end
