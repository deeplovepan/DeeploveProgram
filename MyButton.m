//
//  MyButton.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyButton.h"
#import "MyFile.h"

/*
     default title is center
    
*/

/*
    setImage:forState:  scale image
    setBackgroundImage:forState: will not scal image
 
*/

@implementation MyButton

+(UIButton*)createButton:(NSString*)name pressedImageName:(NSString*)pressedName isProjectFile:(BOOL)isProjectFile onView:(UIView*)view
{
    NSString *path = [FileUtil filePath:name isProjectFile:isProjectFile];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    //[but setImage:image forState:UIControlStateNormal];
    [but setBackgroundImage:image forState:UIControlStateNormal];
    [image release];
    if(pressedName != nil)
    {
        path = [FileUtil filePath:pressedName isProjectFile:isProjectFile];
        image = [[UIImage alloc] initWithContentsOfFile:path];
        //[but setImage:image forState:UIControlStateHighlighted];
        [but setBackgroundImage:image forState:UIControlStateHighlighted];
        [image release];
    }
    [view addSubview:but];
    [but release];
    
    return but;
}


@end
