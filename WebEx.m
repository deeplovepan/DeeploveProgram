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
    if object A use async to download ,
    and object A's delegate is B
    if B's dealloc is called,
    remember to set A's delegate to nil
*/

/*
 [NSURLConnection sendAsynchronousRequest:req queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
    
 
 }
 
 if object is used in completionHandler, it retain count will be increased
 
 ex:
 
 // TestAsyncNoArcViewController.m
 
 -(void)remove:(UIImageView*)imageView
 {
     NSLog(@"remove %d", imageView.tag);
     [imageView removeFromSuperview];
 }

 -(void)test
 {
     NSString *urlStr = @"http://locomote-staging.passionbean.com/system/images/855/original/iphone%20flanerie%20085.jpg?1327030741";
     NSURL *url = [NSURL URLWithString:urlStr];
     NSURLRequest *req = [NSURLRequest requestWithURL:url];    
     
     UIImageView *addImageView = [[TestImageView alloc] initWithFrame:CGRectMake(05, 0,
     200, 200)];
     addImageView.tag = 1;
     [self.view addSubview:addImageView];
     [addImageView release];
     
     UIImageView *addImageView2 = [[TestImageView alloc] initWithFrame:CGRectMake(05, 0,
     200, 200)];
     addImageView2.tag = 2;
     [self.view addSubview:addImageView2];
     [addImageView2 release];
     
     
     NSOperationQueue *queue = [[NSOperationQueue alloc] init];
     NSLog(@"sendAsynchronousRequest");
     [NSURLConnection sendAsynchronousRequest:req queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
     if ([data length] >0 && error == nil)
     {
     NSLog(@"addImageView.contentMode %d", addImageView.contentMode);
     }
     }];
     [queue release];
     [self performSelector:@selector(remove:) withObject:addImageView afterDelay:0.1];
     [self performSelector:@selector(remove:) withObject:addImageView2 afterDelay:0.1];

 }
 
 - (void)viewDidLoad
 {
    [super viewDidLoad];
    [self test];
 }
 
 // TestImageView.m
 -(void)dealloc
 {
     NSLog(@"dealloc %d", self.tag);
     [super dealloc];
 }

 ->
 
 2012-02-15 15:21:14.509 TestAsyncNoArc[3203:707] sendAsynchronousRequest
 2012-02-15 15:21:14.615 TestAsyncNoArc[3203:707] remove 1
 2012-02-15 15:21:14.617 TestAsyncNoArc[3203:707] remove 2
 2012-02-15 15:21:14.620 TestAsyncNoArc[3203:707] dealloc 2
 2012-02-15 15:21:21.095 TestAsyncNoArc[3203:1a03] addImageView.contentMode 0
 2012-02-15 15:21:21.099 TestAsyncNoArc[3203:1a03] dealloc 1

 
*/

/* 
    if use NSURLConnection to send async,
    and object A is NSURLConnection's delegate
    object A's dealloc will not be called until connection finish
 
*/


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
