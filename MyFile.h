//
//  MyFile.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyFile : NSObject {
    
}
+(NSString*)filePath:(NSString*)name isProjectFile:(BOOL)isProjectFile
          typeLength:(int)typeLength;
+(void)deleteFileUnderDocDir:(NSString*)name typeLength:(int)typeLength;
@end
