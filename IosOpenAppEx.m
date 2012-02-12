//
//  IosOpenAppEx.m
//  DeeploveProgram
//
//  Created by  on 12/2/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "IosOpenAppEx.h"

@implementation IosOpenAppEx

/*
    - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
    is called
*/

/*
    if app is not alive, then when openurl is called, 
    the opened app call sequence is
    (1) - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    (2) controller's viewDidLoad & viewWillAppear
    (3)- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
    (4) controller's viewDidAppear
 
     if app is alive, then when openurl is called
     controller's viewWillAppear will not be called
*/

@end
