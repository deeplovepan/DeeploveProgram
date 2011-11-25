//
//  MyTextField.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyTextField.h"


@implementation MyTextField

+(UITextField*)createTextFieldWithFrame:(CGRect)frame onView:(UIView*)view
                                 target:(id)target action:(SEL)action
{
    UITextField *textField = [[UITextField alloc] initWithFrame:
                              frame];
    [view addSubview:textField];
    [textField addTarget:target action:action forControlEvents:UIControlEventEditingDidEndOnExit];
    [textField release];
    
    return textField;
}


@end
