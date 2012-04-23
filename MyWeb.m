//
//  MyWeb.m
//  MyLib
//
//  Created by deeplove on 2010/8/8.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyWeb.h"
#import "JSON.h"
#import "Debug.h"

@implementation MyWeb

+(BOOL)isHttpStatusOk:(int)statusCode
{
    if(statusCode == HTTP_STATUS_OK ||
       statusCode == HTTP_STATUS_CREATED)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(void)downloadImageAsync:(NSString*)urlStr completionHandler:(void (^)(NSData *retData))handler
{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if ([data length] >0 && error == nil)
        {
            handler(data);
        }
        else
        {
            handler(nil);
        }
    }];

}

+(void)sendReqWithUrl:(NSString*)urlStr httpMethod:(char)httpMethod httpBody:(NSData*)httpBody isUploadFile:(BOOL)isUploadFile
      isUseLocalCache:(BOOL)isUseLocalCache CompletionHandler:(void (^)(NSData *retData, NSError *retError))handler
{    
    
    NSURLRequest *req = [MyWeb createRequestWithUrlStr:urlStr method:httpMethod httpBody:httpBody isUploadFile:isUploadFile isUseLocalCache:isUseLocalCache ];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {         
         if ([data length] >0 && error == nil)
         {
             int statusCode = ((NSHTTPURLResponse*)response).statusCode;
             NETWORK_LOG(@"status code %d", statusCode);
             
             if([MyWeb isHttpStatusOk:statusCode])
             {
                 handler(data, nil);
             }
             else
             {
                 error = [NSError errorWithDomain:SERVER_ERROR_DOMAIN code:statusCode userInfo:nil];
                 handler(data, error);
             }
         }
         else
         {
             int statusCode = ((NSHTTPURLResponse*)response).statusCode;
             NETWORK_LOG(@"status code %d error %@", statusCode, error);
             
             handler(nil, error);

         }
     }];

}

+(void)loadLocalHtmlFile:(NSString*)fileName webView:(UIWebView*)webView 
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path isDirectory:NO];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}

+(NSData*)sendReqForUrl:(NSString*)urlString postString:(NSString*)postString lastUpdateTime:(NSString*)lastUpdateTime 
                  action:(char)action error:(NSError**)error
{	
	NSURL *url = [NSURL URLWithString:urlString];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url  
															  cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
														  timeoutInterval:30];
    
    if(lastUpdateTime)
    {
        [urlRequest setValue:lastUpdateTime forHTTPHeaderField:@"If-Modified-Since"];

    }
    
    
    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
    NSString *language = [defauls objectForKey:@"Accept-Language"];
    if(language)
    {
        [urlRequest setValue:language forHTTPHeaderField:@"Accept-Language"];

    }
        
    
    switch (action) {
        case HTTP_ACTION_GET:
            [urlRequest setHTTPMethod: @"GET" ];
            break;
        case HTTP_ACTION_PUT:
        {
            [urlRequest setHTTPMethod: @"PUT" ];
            NSData *body = [postString dataUsingEncoding:NSUTF8StringEncoding];
            [urlRequest setHTTPBody:body];	
            [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];  
            break;
        }
        case HTTP_ACTION_POST:
        {
            [urlRequest setHTTPMethod: @"POST" ];
            NSData *body = [postString dataUsingEncoding:NSUTF8StringEncoding];
            [urlRequest setHTTPBody:body];	
            
            break;
        }
        case HTTP_ACTION_DELETE:
             [urlRequest setHTTPMethod: @"DELETE" ];
             break;
        default:
            break;
    }
        
	NSHTTPURLResponse *urlResponse = nil;
	NSData *responseData = [NSURLConnection sendSynchronousRequest:urlRequest
												 returningResponse:&urlResponse
															 error:error];
    if(error && *error == nil)
    {
        int statusCode = urlResponse.statusCode;
        
        if([MyWeb isHttpStatusOk:statusCode] == NO)
        {
            *error = [NSError errorWithDomain:SERVER_ERROR_DOMAIN code:statusCode userInfo:nil];
            
        }

    }
            
	return responseData;
}



+(NSURLRequest*)createRequestWithUrlStr:(NSString*)urlStr method:(char)method httpBody:(NSData*)body isUploadFile:(BOOL)isUploadFile 
isUseLocalCache:(BOOL)isUseLocalCache
{
        NSURL *url = [NSURL URLWithString:urlStr];
        NSMutableURLRequest *urlRequest;
        if(isUseLocalCache)
        {
            urlRequest =   [NSMutableURLRequest requestWithURL:url  
                                                   cachePolicy:NSURLRequestUseProtocolCachePolicy
                                               timeoutInterval:30];

        }
        else
        {
            urlRequest = [NSMutableURLRequest requestWithURL:url  
                                    cachePolicy:NSURLRequestReloadIgnoringCacheData
                                timeoutInterval:30];

        }
          
        NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
        NSString *language = [defauls objectForKey:@"Accept-Language"];
        if(language)
        {
            [urlRequest setValue:language forHTTPHeaderField:@"Accept-Language"];
            
        }

        switch (method) {
            case HTTP_ACTION_GET:
                [urlRequest setHTTPMethod: @"GET" ];
                break;
            case HTTP_ACTION_PUT:
            {
                [urlRequest setHTTPMethod: @"PUT" ];
                [urlRequest setHTTPBody:body];
                if(isUploadFile == NO)
                {
                    [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];  

                }
                break;
            }
            case HTTP_ACTION_POST:
            {
                [urlRequest setHTTPMethod: @"POST" ];
                [urlRequest setHTTPBody:body];	
                
                break;
            }
            case HTTP_ACTION_DELETE:
                [urlRequest setHTTPMethod: @"DELETE" ];
                break;
            case HTTP_ACTION_PATCH:
            {
                [urlRequest setHTTPMethod: @"PATCH" ];
                [urlRequest setHTTPBody:body];	
                [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];  
                break;
            }
            default:
                break;
        }
    
    return urlRequest;

}

+(id)getJsonData:(NSData*)data error:(NSError**)error
{
    NSString *responseString = [[NSString alloc] initWithData:data
                                                     encoding:NSUTF8StringEncoding];
    id jsonData = [responseString JSONValue];
    if(jsonData == nil)
    {
        *error = [NSError errorWithDomain:SERVER_ERROR_DOMAIN code:STATUS_JSON_DATA_EMPTY userInfo:nil];
    }

    return jsonData;
}

+(id)sendReqForUrlAndGetJson:(NSString*)urlString postString:(NSString*)postString lastUpdateTime:(NSString*)lastUpdateTime 
                       action:(char)action error:(NSError**)error
{	
    NSData *responseData = [MyWeb sendReqForUrl:urlString postString:postString lastUpdateTime:lastUpdateTime action:action error:error];
    id jsonData = nil;
    if(responseData)
    {
        NSString *responseString = [[NSString alloc] initWithData:responseData
                                                         encoding:NSUTF8StringEncoding];
        jsonData = [responseString JSONValue];

    }
    if(jsonData == nil)
    {
        *error = [NSError errorWithDomain:SERVER_ERROR_DOMAIN code:STATUS_JSON_DATA_EMPTY userInfo:nil];
    }
	return jsonData;
}

+(NSData*)sendReqForUrl:(NSString*)urlString body:(NSData*)body
{	
	NSURL *url = [NSURL URLWithString:urlString];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url  
								cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
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
