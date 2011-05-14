//
//  UIActivityIndicatorViewEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/5/10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIActivityIndicatorViewEx.h"


@implementation UIActivityIndicatorViewEx

+(void)removeUIActivityIndicatorView:(UIActivityIndicatorView*)activityIndicatorView
{
    [activityIndicatorView stopAnimating];
    [activityIndicatorView removeFromSuperview];
}

+(void)showUIActivityIndicatorView:(UIView*)view
{
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc]
                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicatorView.center = CGPointMake(100, 100);
    
    [view addSubview:activityIndicatorView];
    [activityIndicatorView release];
    [activityIndicatorView startAnimating];
}


@end
