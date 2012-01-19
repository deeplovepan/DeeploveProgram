//
//  MyTabBarControllerEx.m
//  DeeploveProgram
//
//  Created by  on 11/12/4.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyTabBarControllerEx.h"

@implementation MyTabBarControllerEx

/*
      show tab bar in portrait mode, hide tab bar in landscape mode for specific tab
      ex:
         there are 4 tabs ( tab 0 ~ 3)
         hide tab bar in landscape mode for tab 0
 
         (1)
         tab 0's view controller: 
            - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
            {
                if(UIInterfaceOrientationIsPortrait(interfaceOrientation))
                {
                     self.tabBarController.tabBar.hidden = NO;
                }
                else
                {
                     self.tabBarController.tabBar.hidden = YES;   
                }
                return YES;
            }
 
         tab 1 ~ 3's view controller: 
            - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
                if(self.tabBarController.selectedIndex == 0)
                    return YES;
                else
                     return UIInterfaceOrientationIsPortrait(interfaceOrientation);


         (2) set transview size:
                UIView *transView = [self.tabBarController.view.subviews objectAtIndex:0];
                transView.frame = CGRectMake(0, 0, 320, 480);

*/


/*
    rotate:
        when rotate, shouldAutorotateToInterfaceOrientation of each controller of tab will be called
        Only if they all return YES, orientation is supported
 
*/


/* 
    pop current tab controller to root & switch to another tab 
    
    note: must set  selectedIndex before call popToRootViewControllerAnimated
 
        self.tabBarController.selectedIndex = 0;
        [self.navigationController popToRootViewControllerAnimated:NO];

*/



// storyboard tab bar controller
//      tab bar sequence can be checked from Tab Bar Controller Secene
//      the relationship from top to down define tab from left to right
//      modify tab sequence:
//          click on tab in tab bar to move tab


/*
  tabBarController:shouldSelectViewController: is called before controller's 
   viewWillAppear called
  tabBarController:didSelectViewController: is called after controller's 
   viewWillAppear called
*/

/* click on tab
    the UINavigationController related to tab will pop to root  
 
*/

// hide navBar and tabBar
/*
 (1) 
 -(void)viewWillAppear:(BOOL)animated
 {
    [super viewWillAppear:animated];
 
    for(UIView *view in self.tabBarController.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]] == NO)
        {
                view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 320);
        }
    }
 
 }
 
 (2)
 - (void)viewDidAppear:(BOOL)animated
 {
    [super viewDidAppear:animated];
 
    // original: 0, 32, 480, 288
    self.view.superview.frame = CGRectMake(0, 0, 480, 320);

 }

 (3) hide nav bar & tab bar
     tabBarController.tabBar.hidden = YES;
     navigationController.navigationBar.hidden = YES;
 
*/

/*
   view controller of each tab 
     viewDidLoad is called only once when view of view controller first shows
*/
 
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
