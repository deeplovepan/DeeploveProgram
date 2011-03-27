//
//  MyAsnycDownload.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyAsnycDownload.h"


@implementation MyAsnycDownload

@synthesize downloadData;
@synthesize downloadConnection;

-(void)download:(NSString*)urlStr
{
    NSURL *url = [NSURL URLWithString:urlStr];
    self.downloadData = [[NSMutableData alloc] init];
    [self.downloadData release];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    self.downloadConnection = [[NSURLConnection alloc] 
                               initWithRequest:req delegate:self
                               startImmediately:YES];
    [self.downloadConnection release];
    
    
}

-(void)dealloc
{
    [downloadConnection release];
    [downloadData release];
    [super dealloc];
}

#pragma mark - NSURLConnectionDelegate

// one request may call this method more than once,
// hence we set length to 0 to dispose of previously allocated data
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //NSLog(@"didReceiveResponse");
    [self.downloadData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //NSLog(@"data %d", [data length]);
    [self.downloadData appendData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //NSLog(@"Successfully connectionDidFinishLoading");
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //NSLog(@"error %@", error);
}

@end
