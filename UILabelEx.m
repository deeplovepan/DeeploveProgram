//
//  UILabelEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/5/22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UILabelEx.h"


@implementation UILabelEx

// adjuxt font size to fit width
/*
    UILabel *label;
    label.adjustsFontSizeToFitWidth = YES; (Autoshrink in interface builder)
*/

-(void)enableMultilineLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.numberOfLines = 0;
}

@end
