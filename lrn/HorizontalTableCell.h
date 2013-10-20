//
//  HorizontalTableCell.h
//  lrn
//
//  Created by Brandon Leventhal on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalTableCell : UITableViewCell <UITableViewDelegate, UITableViewDataSource>
{
   UITableView *_horizontalTableView;
   NSArray *_articles;
}

@property (nonatomic, retain) UITableView *horizontalTableView;
@property (nonatomic, retain) NSArray *articles;

@end
