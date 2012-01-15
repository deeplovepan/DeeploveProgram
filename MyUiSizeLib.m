//
//  MyUiSizeLib.m
//  DeeploveProgram
//
//  Created by  on 12/1/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyUiSizeLib.h"

@implementation MyUiSizeLib

// ex: iphone retina is 640 * 960
+(CGSize)getScreenResolution
{
    UIScreen *MainScreen = [UIScreen mainScreen];
    UIScreenMode *ScreenMode = [MainScreen currentMode];
    CGSize size = [ScreenMode size]; 
    
    return size;
}

@end
