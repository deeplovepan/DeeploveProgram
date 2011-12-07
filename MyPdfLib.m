//
//  MyPdfLib.m
//  DeeploveProgram
//
//  Created by  on 11/11/25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyPdfLib.h"

@implementation MyPdfLib

+(UIWebView*)getPdfOnWebview:(NSString*)name 
{
    NSString *pdfUrl = [[NSBundle mainBundle] pathForResource:name ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:pdfUrl];
    NSURLRequest *rq = [NSURLRequest requestWithURL:url];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [webView loadRequest:rq];
    webView.scalesPageToFit = YES;
    
    [webView autorelease];
    
    return webView;
}

@end
