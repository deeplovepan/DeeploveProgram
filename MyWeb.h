//
//  MyWeb.h
//  MyLib
//
//  Created by deeplove on 2010/8/8.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SERVER_ERROR_DOMAIN @"SERVER_ERROR"

#define HTTP_STATUS_OK 200
#define HTTP_STATUS_CREATED 201
#define HTTP_STATUS_NOT_MODIFIED 304
#define HTTP_STATUS_BAD_REQUEST  400
#define HTTP_STATUS_AUTH_FAIL 401
#define HTTP_STATUS_FORBIDDEN 403
#define HTTP_STATUS_DATA_NOT_FOUND 404
// 5xx 
#define HTTP_STATUS_SERVER_ERROR 500

#define STATUS_JSON_DATA_EMPTY  1000

#define HTTP_ACTION_GET 0
#define HTTP_ACTION_POST 1
#define HTTP_ACTION_DELETE 2
#define HTTP_ACTION_PUT 3
#define HTTP_ACTION_PATCH 4

#define SYNC_INIT 0
#define SYNC_SYNC 1
#define SYNC_UNSYNC 2
#define SYNC_DELETE_UNSYNC 3 

#define API_RESULT_OK @"OK"
#define API_RESULT_ERROR @"ERROR"


@interface MyWeb : NSObject {

}

+(void)sendReqWithUrl:(NSString*)urlStr httpMethod:(char)httpMethod httpBody:(NSData*)httpBody isUploadFile:(BOOL)isUploadFile
      isUseLocalCache:(BOOL)isUseLocalCache CompletionHandler:(void (^)(NSData *retData, NSError *retError))handler;
+(void)loadLocalHtmlFile:(NSString*)fileName webView:(UIWebView*)webView;
+(NSData*)sendReqForUrl:(NSString*)urlString body:(NSData*)body;
+(NSData*)sendReqForUrl:(NSString*)urlString postString:(NSString*)postString lastUpdateTime:(NSString*)lastUpdateTime
                  action:(char)action error:(NSError**)error;
+(id)sendReqForUrlAndGetJson:(NSString*)urlString postString:(NSString*)postString lastUpdateTime:(NSString*)lastUpdateTime 
                      action:(char)action error:(NSError**)error;
+(BOOL)isHttpStatusOk:(int)statusCode;
+(id)getJsonData:(NSData*)data error:(NSError**)error;

+(NSURLRequest*)createRequestWithUrlStr:(NSString*)urlStr method:(char)method httpBody:(NSData*)body isUploadFile:(BOOL)isUploadFile 
                        isUseLocalCache:(BOOL)isUseLocalCache;
+(void)downloadImageAsync:(NSString*)urlStr completionHandler:(void (^)(NSData *retData))handler;
@end
 