//
//  DetectTapScrollView.m
//  Groupon
//
//  Created by deeplove on 2011/7/12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DetectTapScrollView.h"

@implementation DetectTapScrollView


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *) event 
{	
    // detect tap
    if (!self.dragging) 
    {
       
    }
    else
    {
        [super touchesEnded: touches withEvent: event];
    }
}

@end
