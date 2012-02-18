//
//  iosNavigationLib.m
//  DeeploveProgram
//
//  Created by Peter Pan on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IosNavigationLib.h"

@implementation IosNavigationLib

+(id)getPreviousViewController:(UINavigationController*)navController
{
    int count = [navController.viewControllers count];
    id prevController = [navController.viewControllers objectAtIndex:count-2];
    return prevController;
}


@end
