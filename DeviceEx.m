//
//  DeviceEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/25.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DeviceEx.h"


@implementation DeviceEx

// check device is iPhone or iPad
// iPhone
if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
{
    
}
// iPad
else
{
    
}

+(void)getDeviceId
{
    UIDevice *device = [UIDevice currentDevice];
    NSString *uniqueIdentifier = [device uniqueIdentifier];
    
    return uniqueIdentifier;
}

@end
