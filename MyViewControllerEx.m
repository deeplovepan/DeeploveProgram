//
//  MyViewControllerEx.m
//  DeeploveProgram
//
//  Created by Peter Pan on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyViewControllerEx.h"

@implementation MyViewControllerEx

/* 
    if we use nav controller to push controller A, then push controller B
    now we want to show controller C, discad nav controller
 
    solution:
        set delegate.window.rootViewController as controller C

*/


/*
    viewDidUnload will remove subview
*/
 
/*
    when viewDidLoad, UI's height may not be the same as height set in Storybard
    the height will be the same as set in storyboard when viewWillAppear
*/

@end
