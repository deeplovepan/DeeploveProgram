//
//  ThreadEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ThreadEx.h"


@implementation ThreadEx

/* performSelectorInBackground
    if call performSelectorInBackground, object will be alive until background thread done
*/

+(void)printThread
{
    NSLog(@"main thread %@", [NSThread mainThread]);
    NSLog(@"current thread %@", [NSThread currentThread]);
}

@end
