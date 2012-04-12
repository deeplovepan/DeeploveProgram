//
//  OnePhoto.m
//  DeeploveProgram
//
//  Created by Peter Pan on 12/4/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OnePhoto.h"

@implementation OnePhoto

-(void)removeBigPhoto:(UIButton*)sender
{
    [sender removeFromSuperview];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
}

-(void)shwoBigPhoto:(id)sender
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    UIButton *blockButton = [[UIButton alloc] initWithFrame:delegate.window.frame];
    //[self.view addSubview:blockButton];
    //blockButton.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    blockButton.backgroundColor = [UIColor blackColor];
    [delegate.window addSubview:blockButton];
    [blockButton addTarget:self action:@selector(removeBigPhoto:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [MyWeb downloadImageAsync:self.event.origin_image_url completionHandler:^(NSData *retData) {
        if(retData)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:blockButton.frame];
            imageView.image = [[UIImage alloc] initWithData:retData];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [blockButton addSubview:imageView];
            
        }
    }];
}

@end
