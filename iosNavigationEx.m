//
//  iosNavigationEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/5/21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "iosNavigationEx.h"


@implementation iosNavigationEx

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
