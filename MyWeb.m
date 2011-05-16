//
//  MyWeb.m
//  MyLib
//
//  Created by deeplove on 2010/8/8.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyWeb.h"
#import "JSON.h"

@implementation MyWeb

+(void)showPage:(UIWebView*)webView withUrlStr:(NSString*)urlStr
{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    
}

+(NSData*)sendReqForUrl:(NSString*)urlString postString:(NSString*)postString
{	
	NSURL *url = [NSURL URLWithString:urlString];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url  
															  cachePolicy:NSURLRequestReturnCacheDataElseLoad
														  timeoutInterval:30];
	if(postString == nil)
	{
		[urlRequest setHTTPMethod: @"GET" ];
	}
	else
	{
		NSData *body = [postString dataUsingEncoding:NSUTF8StringEncoding];
		[urlRequest setHTTPMethod: @"POST" ];
		[urlRequest setHTTPBody:body];
		
		
	}
	
	NSURLResponse *urlResponse = nil;
	NSError *error = nil;
	NSData *responseData = [NSURLConnection sendSynchronousRequest:urlRequest
												 returningResponse:&urlResponse
															 error:&error];
	return responseData;
}


+(NSDictionary*)sendReqForUrlAndGetJsonDic:(NSString*)urlString postString:(NSString*)postString
{	
  
    NSData *responseData = [MyWeb sendReqForUrl:urlString postString:postString];
    NSString *responseString = [[NSString alloc] initWithData:responseData
                                                     encoding:NSUTF8StringEncoding];
    NSDictionary *dic = [responseString JSONValue];
    [responseString release];
    
	return dic;
}

+(NSData*)sendReqForUrl:(NSString*)urlString body:(NSData*)body
{	
	NSURL *url = [NSURL URLWithString:urlString];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url  
								cachePolicy:NSURLRequestReturnCacheDataElseLoad
								timeoutInterval:30];
	if(body == nil)
	{
		[urlRequest setHTTPMethod: @"GET" ];
	}
	else
	{
		[urlRequest setHTTPMethod: @"POST" ];
		[urlRequest setHTTPBody:body];


	}
	
	NSURLResponse *urlResponse = nil;
	NSError *error = nil;
	NSData *responseData = [NSURLConnection sendSynchronousRequest:urlRequest
												 returningResponse:&urlResponse
															 error:&error];
    return responseData;
}

@end
