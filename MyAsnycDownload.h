//
//  MyAsnycDownload.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyAsnycDownload : NSObject {
    NSMutableData *downloadData;
    NSURLConnection *downloadConnection;
}
@property (nonatomic, retain) NSMutableData *downloadData;
@property (nonatomic, retain) NSURLConnection *downloadConnection;

-(void)download:(NSString*)urlStr;

@end
