//
//  MyTabBarControllerEx.m
//  DeeploveProgram
//
//  Created by  on 11/12/4.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyTabBarControllerEx.h"

@implementation MyTabBarControllerEx

// (1) view controller of each tab 
//     viewDidLoad is called only once when view of view controller first shows

+(void)setTabBarTitle:(UIViewController*)controller title:(NSString*)title
{
    controller.title = title;
}

// landscape mode:
//   nav bar: 32px
//   tab bar: 49px
//   controller's view: 320- 32 - 49 = 239 (viewWillAppear:)
+(void)createTabBarNavigation:(UIWindow*)window
{
    UIViewController *viewController1 = [[[IceCreamFirstViewController alloc] init] autorelease];
    UINavigationController *navController1 = [[[UINavigationController alloc] initWithRootViewController:viewController1] autorelease];
    
    
    UIViewController *viewController2 = [[[IceCreamSecondViewController alloc] init] autorelease];
    UINavigationController *navController2 = [[[UINavigationController alloc] initWithRootViewController:viewController2] autorelease];
    
    UITabBarController *tabBarController = [[[UITabBarController alloc] init] autorelease];
    tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, navController2, nil];
    window.rootViewController = tabBarController;
}

@end
