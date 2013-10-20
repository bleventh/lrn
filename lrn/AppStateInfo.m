//
//  AppStateInfo.m
//  lrn
//
//  Created by Brandon Leventhal on 10/20/13.
//  Copyright (c) 2013 KBS. All rights reserved.
//

#import "AppStateInfo.h"
static NSString * currentClassName;
@implementation AppStateInfo

+(void)setCurrentClass:(NSString *)name {
   currentClassName = name;
}
+(NSString *)getCurrentClass {
   return currentClassName;
}
@end
