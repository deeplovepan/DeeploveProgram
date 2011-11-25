//
//  TextFieldEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TextFieldEx.h"


@implementation TextFieldEx

+(void)disappearKeyboardWhenEnterPressed:(UITextField*)textField
target:(id)target action:(SEL)action
{
     [textField addTarget:target action:action forControlEvents:UIControlEventEditingDidEndOnExit];
}

+(void)disappearKeyboard:(UITextField*)textField
{
    [textField resignFirstResponder];

}

+(void)setPasswordTextfield:(UITextField*)textField
{
    textField.secureTextEntry = YES;
}

+(void)setRoundCornerTextfield:(UITextField*)textField
{
    textField.borderStyle = UITextBorderStyleRoundedRect;

}

+(void)disableAutocapitalization:(UITextField*)textField
{
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;

}

// disappear keyboard




@end
