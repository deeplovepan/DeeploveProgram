//
//  TextFieldEx.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TextFieldEx : NSObject {
    
}

+(void)setPasswordTextfield:(UITextField*)textField;
+(void)setRoundCornerTextfield:(UITextField*)textField;
+(void)disableAutocapitalization:(UITextField*)textField;
+(void)disappearKeyboard:(UITextField*)textField;
+(void)disappearKeyboardWhenEnterPressed:(UITextField*)textField
                target:(id)target action:(SEL)action;


@end
