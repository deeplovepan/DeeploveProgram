//
//  WebEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "WebEx.h"


@implementation WebEx

+(void)setWebviewTransparent:(UIWebView*)webView
{
    webView.opaque = NO;
    webView.backgroundColor = [UIColor clearColor];
}

@end
