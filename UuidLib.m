//
//  UuidLib.m
//  DeeploveProgram
//
//  Created by Peter Pan on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UuidLib.h"

@implementation UuidLib

+(NSString*)createUuid
{
    uuid = CFUUIDCreate(kCFAllocatorDefault);
    uuidRef = CFUUIDCreateString(kCFAllocatorDefault, uuid);
    CFRelease(uuid);
    
    return uuidRef;

}

@end
