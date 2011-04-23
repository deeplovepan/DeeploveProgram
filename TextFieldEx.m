//
//  TextFieldEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TextFieldEx.h"


@implementation TextFieldEx

+(void)setPasswordTextfield:(UITextField*)textField
{
    textField.secureTextEntry = YES;
}

+(void)disableAutocapitalization:(UITextField*)textField
{
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;

}

@end
