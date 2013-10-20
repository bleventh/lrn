//
//  AppStateInfo.h
//  lrn
//
//  Created by Brandon Leventhal on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppStateInfo : NSObject
+ (void)setCurrentClass:(NSString *)name;
+(NSString *)getCurrentClass;
@end
