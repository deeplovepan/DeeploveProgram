//
//  MyActivityIndicatorViewLib.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/5/11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyActivityIndicatorViewLib.h"


@implementation MyActivityIndicatorViewLib

+(UIView*)showUIActivityIndicatorView:(UIView*)view size:(CGSize)size
{
    UIView *blackView = [[UIView alloc] initWithFrame:
                         CGRectMake(0, 0, size.width, size.height)];
	blackView.backgroundColor = [UIColor colorWithWhite:0.0
                                                  alpha:0.8];
	blackView.clipsToBounds = YES;
	if ([blackView.layer respondsToSelector: @selector(setCornerRadius:)]) 
	{
		[blackView.layer setCornerRadius: 10];
	}
    [view addSubview:blackView];
    [blackView release];
    
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc]
                                                      initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicatorView.center = CGPointMake(blackView.frame.size.width/2, 
                                               blackView.frame.size.height/2);
    
    [blackView addSubview:activityIndicatorView];
    [activityIndicatorView release];
    [activityIndicatorView startAnimating];
    
    return blackView;
}

@end
