//
//  iosNavigationEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/5/21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "iosNavigationEx.h"


@implementation iosNavigationEx

// - (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
/*
    if controller A push controller B in method test
    after call pushViewController:animated:, 
    controller B's viewDidLoad & viewWillAppear will be called
    then code in method test after push is executed ( before controller B's viewDidAppear is called )
*/

// (1) if controller A is navigation controller's top controller,
// and A call setBackButtonTitle to set back title
// (2) Then when navigation controller push controller B
// the back Button to A's title is the title set in step (1)
-(void)setBackButtonTitle:(NSString*)backTitle
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    [backItem release];
}

-(void)addLeftArrowButtonOnNavBar
{
    UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithCustomView:arrowView];
    self.navigationItem.rightBarButtonItem = backItem;
    [backItem release];
}

// set title of UINavigationBar
-(void)setNavigationBarTitle
{
    self.navigationItem.title = @"hello"; 
}

-(void)backToParentController
{
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)showChildController
{
    TestController *controller = [[TestController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

-(void)getPreviousViewController
{
    int count = [self.navigationController.viewControllers count];
    id prevController = [self.navigationController.viewControllers objectAtIndex:count-2] ;
}

-(void)addRightButton
{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                  target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
}



@end
