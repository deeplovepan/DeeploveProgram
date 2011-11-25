//
//  iosAnimationEx.m
//  DeeploveProgram
//
//  Created by  on 11/7/29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "iosAnimationEx.h"

@implementation iosAnimationEx

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)rotateLabelDown {
    
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         label.transform = CGAffineTransformMakeRotation(M_PI);
                     }
                     completion:^(BOOL finished){ 
                         [self rotateLabelUp]; }];
    
}

- (void)rotateLabelUp {
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         label.transform = CGAffineTransformMakeRotation(0);
                     }
                     completion:^(BOOL finished){
                         if (animate) {
                             [self rotateLabelDown]; 
                         }
                     }];
}


@end
