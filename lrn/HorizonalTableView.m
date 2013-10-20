//
//  HorizonalTableView.m
//  lrn
//
//  Created by Brandon Leventhal on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "HorizonalTableView.h"

@implementation HorizonalTableView

/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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

      const CGFloat k90DegreesCounterClockwiseAngle = (CGFloat) -(90 * M_PI / 180.0);

      CGRect frame = self.frame;
      self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, k90DegreesCounterClockwiseAngle);
      self.frame = frame;

   }
   [self setShowsHorizontalScrollIndicator:NO];
   [self setShowsVerticalScrollIndicator:NO];

   assert(self);
   return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
