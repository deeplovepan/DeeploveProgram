//
//  MyWeb.h
//  MyLib
//
//  Created by deeplove on 2010/8/8.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyWeb : NSObject {

}
+(void)loadLocalHtmlFile:(NSString*)fileName webView:(UIWebView*)webView;
+(NSData*)sendReqForUrl:(NSString*)urlString body:(NSData*)body;
+(NSData*)sendReqForUrl:(NSString*)urlString postString:(NSString*)postString;
+(NSDictionary*)sendReqForUrlAndGetJsonDic:(NSString*)urlString 
                                postString:(NSString*)postString;

@end
