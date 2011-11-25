//
//  iosProperyEx.m
//  DeeploveProgram
//
//  Created by  on 2011/7/10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "iosProperyEx.h"

@implementation iosProperyEx

// 1. instance variable name can be different from propery name
// ex:

@interface People : NSObject
{
    NSString *name;
}
@property (nonatomic, return) NSString *goodName;

@synthesize goodName = name;

// 2. we can only declare propery and not declare instance variable in { } 



- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
