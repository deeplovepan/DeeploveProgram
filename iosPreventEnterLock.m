//
//  iosPreventEnterLock.m
//  DeeploveProgram
//
//  Created by Peter Pan on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "iosPreventEnterLock.h"

@implementation iosPreventEnterLock

[UIApplication sharedApplication].idleTimerDisabled = YES;


@end
