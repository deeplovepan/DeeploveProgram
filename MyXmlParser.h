//
//  XmlEx.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyXmlParser : NSObject <NSXMLParserDelegate>{
    NSXMLParser *xmlParser;
}
-(void)parseFile:(NSString*)path;

@end
