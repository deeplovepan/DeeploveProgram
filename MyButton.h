//
//  MyButton.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyButton : NSObject {
    
}
+(UIButton*)createButton:(NSString*)name pressedImageName:(NSString*)pressedName isProjectFile:(BOOL)isProjectFile onView:(UIView*)view;

@end
