//
//  MyImageView.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView

+(UIImage*)resizeWithImage:(UIImage*)image width:(float)width height:(float)height {
	
    CGRect rect = CGRectMake(0, 0, width, height);
    UIGraphicsBeginImageContext(rect.size);
	[image drawInRect:rect];
	UIImage *imageCopy =  UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return imageCopy;
}


@end
