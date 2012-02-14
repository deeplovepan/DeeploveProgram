//
//  WebEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "WebEx.h"


@implementation WebEx

/*
    cache:
 
        1. use NSURLRequestReloadIgnoringLocalCacheData:
           always get data from server
           ex:
                2012-02-14 17:37:53.719 TestNetworkCache[1025:707] start
                2012-02-14 17:37:56.002 TestNetworkCache[1025:707] didReceiveData 0x1372600
                2012-02-14 17:37:56.004 TestNetworkCache[1025:707] didReceiveData 0xb78600
                2012-02-14 17:37:56.007 TestNetworkCache[1025:707] connectionDidFinishLoading
                2012-02-14 17:38:02.312 TestNetworkCache[1025:707] start
                2012-02-14 17:38:05.018 TestNetworkCache[1025:707] didReceiveData 0xb7dc00
                2012-02-14 17:38:05.020 TestNetworkCache[1025:707] connectionDidFinishLoading
 
        2. use NSURLRequestReturnCacheDataElseLoad or NSURLRequestUseProtocolCachePolicy
            if there is local cache, don't get from server
            ex:
                 2012-02-14 17:43:31.172 TestNetworkCache[1049:707] start
                 2012-02-14 17:43:35.200 TestNetworkCache[1049:707] didReceiveData 0xbec000                
                 2012-02-14 17:43:35.203 TestNetworkCache[1049:707] didReceiveData 0x13cc600
                 2012-02-14 17:43:35.205 TestNetworkCache[1049:707] connectionDidFinishLoading
                 2012-02-14 17:43:40.200 TestNetworkCache[1049:707] start
                 2012-02-14 17:43:40.205 TestNetworkCache[1049:707] didReceiveData 0x30c6e0
                 2012-02-14 17:43:40.206 TestNetworkCache[1049:707] connectionDidFinishLoading
                 2012-02-14 17:43:41.688 TestNetworkCache[1049:707] start
                 2012-02-14 17:43:41.690 TestNetworkCache[1049:707] didReceiveData 0x130e90
                 2012-02-14 17:43:41.691 TestNetworkCache[1049:707] connectionDidFinishLoading

*/

                   

/*
    accepts-encoding: gzip is add by default 
*/


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
