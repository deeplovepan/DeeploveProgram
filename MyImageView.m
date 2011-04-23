//
//  MyImageView.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyImageView.h"
#import "MyFile.h"

@implementation MyImageView

+(UIImageView*)createImageView:(NSString*)name isPojectFile:(BOOL)isPojectFile onView:(UIView*)view
{
    NSString *path = [FileUtil filePath:name isProjectFile:isPojectFile];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [image release];
    [view addSubview:imageView];
    [imageView release];
    
    return imageView;
}


@end
