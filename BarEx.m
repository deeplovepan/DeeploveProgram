//
//  BarEx.m
//  DeeploveProgram
//
//  Created by Peter Pan on 1/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BarEx.h"

@implementation BarEx

// hide status bar
[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

// hide tab bar
self.tabBarController.tabBar.hidden = NO;

// hide nav bar
self.navigationController.navigationBar.hidden = NO;


@end
