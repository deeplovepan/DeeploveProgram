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
*/

+(void)setWebviewTransparent:(UIWebView*)webView
{
    webView.opaque = NO;
    webView.backgroundColor = [UIColor clearColor];
}

@end
