//
//  WebEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "WebEx.h"


@implementation WebEx

// if json contain null value
/*
        ex: "deadline":null
        compare it with [NSNull null]

/* problem: create UIWebView in viewDidLoad or viewWillAppear will slow view appear     
            speed 
   solution: create UIWebVie in viewDidAppear
*/

+(void)setWebviewTransparent:(UIWebView*)webView
{
    webView.opaque = NO;
    webView.backgroundColor = [UIColor clearColor];
}

@end
