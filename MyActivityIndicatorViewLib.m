//
//  MyActivityIndicatorViewLib.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/5/11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyActivityIndicatorViewLib.h"
#import <QuartzCore/QuartzCore.h>

@implementation MyActivityIndicatorViewLib

+(UIView*)showUIActivityIndicatorOnView:(UIView*)view frame:(CGRect)frame text:(NSString*)text
{
    UIView *blackView = [[UIView alloc] initWithFrame:frame];
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
    
    if(text != nil)
    {
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        textLabel.center = CGPointMake(blackView.frame.size.width/2, 
                                       blackView.frame.size.height-15);
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.text = text;
        textLabel.textAlignment = UITextAlignmentCenter;
        textLabel.textColor = [UIColor whiteColor];
        [blackView addSubview:textLabel];
        [textLabel release];
    }
    
    [activityIndicatorView startAnimating];
    
    return blackView;
}

@end
