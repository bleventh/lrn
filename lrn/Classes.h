//
//  Classes.h
//  lrn
//
//  Created by Brandon Leventhal on 10/19/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClassPickerDelegate <NSObject>
@required
-(void)selectedClass:(NSString *)class;
@end

@interface Classes : UITableViewController

@property (nonatomic, strong) NSMutableArray *classes;
@property (nonatomic, weak) id<ClassPickerDelegate> delegate;
@end
