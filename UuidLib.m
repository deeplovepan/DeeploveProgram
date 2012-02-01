//
//  UuidLib.m
//  DeeploveProgram
//
//  Created by Peter Pan on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UuidLib.h"

@implementation UuidLib

// ex: 0D050FD7-D6BB-4152-8F3E-C202AF45A3BC
+(NSString*)createUuid
{
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef uuidRef = CFUUIDCreateString(kCFAllocatorDefault, uuid);
    CFRelease(uuid);
    
    return (__bridge NSString*)uuidRef;
    
}

@end
