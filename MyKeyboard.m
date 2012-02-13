//
//  MyKeyboard.m
//  DeeploveProgram
//
//  Created by  on 11/12/30.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyKeyboard.h"

@implementation MyKeyboard

-(void)hideKeyboard:(UIView*)view
{
    for(UIView *subView in view.subviews)
    {
        if(subView.isFirstResponder)
        {
            [subView resignFirstResponder];
            break;
        }
    }

}

@end
