//
//  iOsStringEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/6/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "iOsStringEx.h"


@implementation iOsStringEx

-(NSArray*)getArraySpearatedBySpaceAndNewLineFromString:(NSString*)content
{
    NSCharacterSet *whitespaceAndNewline = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSArray *array = [content componentsSeparatedByCharactersInSet:
                      whitespaceAndNewline];
    return  array;
}

@end
