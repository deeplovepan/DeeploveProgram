//
//  MathEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MathEx.h"


@implementation MathEx

+(int)getRandomNumberFrom0toNumberDecreaseOne:(int)num
{
    return arc4random()%num;
}

+(int)getAbsoluteValue(float a, float b)
{
    return fabsf(a-b);
}


@end
