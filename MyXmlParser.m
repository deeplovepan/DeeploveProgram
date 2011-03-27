//
//  XmlEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyXmlParser.h"


@implementation MyXmlParser

-(void)parseFile:(NSString*)path
{
    NSData *data = [NSData dataWithContentsOfFile:path];
    xmlParser = [[NSXMLParser alloc] initWithData:data];
    [xmlParser setDelegate:self];
    [xmlParser parse];
    [xmlParser release];
}

#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    /*
    NSLog(@"didStartElement");
    NSLog(@"elementName %@", elementName);
    for(id key in attributeDict)
    {
        NSLog(@"attribute %@", [attributeDict objectForKey:key]);
    }
    */
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //NSLog(@"foundCharacters %@", string);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    /*
    NSLog(@"didEndElement");
    NSLog(@"elementName %@", elementName);    
    */
}

@end
