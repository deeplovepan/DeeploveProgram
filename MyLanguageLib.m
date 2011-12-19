//
//  MyLanguageLib.m
//  DeeploveProgram
//
//  Created by  on 11/12/19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyLanguageLib.h"

@implementation MyLanguageLib

// zh-Hant is traditional chinese
+(NSString*)getCurrentLanguage
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    NSString *currentLanguage = [languages objectAtIndex:0];
    return currentLanguage;

}

@end
