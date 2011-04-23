//
//  MyImageView.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyImageView : NSObject {
    
}
+(UIImageView*)createImageView:(NSString*)name isPojectFile:(BOOL)isPojectFile onView:(UIView*)view;
@end
