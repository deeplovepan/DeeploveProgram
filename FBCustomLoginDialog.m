//
//  FBCustomLoginDialog.m
//  FacebookLike
//
//  Created by deeplove on 2011/6/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "FBCustomLoginDialog.h"


@implementation FBCustomLoginDialog

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
    NSURL* url = request.URL;
    if ([[url absoluteString] rangeOfString:@"login"].location==NSNotFound) {
        [self dialogDidSucceed:url];
        return NO;
    }else if (url!=nil){
        [_spinner startAnimating];
        [_spinner setHidden:NO];
        return YES;
    }
    return NO;
}

@end
