//
//  MyTextField.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyTextField : NSObject {
    
}
+(UITextField*)createTextFieldWithFrame:(CGRect)frame onView:(UIView*)view
                                 target:(id)target action:(SEL)action;
@end
