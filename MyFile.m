//
//  MyFile.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyFile.h"


@implementation MyFile

+(void)deleteFileUnderDocDir:(NSString*)name typeLength:(int)typeLength
{
    NSString *path = [MyFile filePath:name isProjectFile:NO typeLength:typeLength];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:path error:NULL];
}

+(NSString*)filePath:(NSString*)name isProjectFile:(BOOL)isProjectFile
          typeLength:(int)typeLength
{
	
	
    if(isProjectFile)
	{
		NSArray *stringArray = [name componentsSeparatedByString:@"/"];
		
		if([stringArray count] == 2)
		{
			return [[NSBundle mainBundle]
					pathForResource:[[stringArray objectAtIndex:1] substringToIndex:[[stringArray objectAtIndex:1] length]-(typeLength+1)] 
					ofType:[[stringArray objectAtIndex:1] substringFromIndex:[[stringArray objectAtIndex:1] length]-typeLength]
					inDirectory:[stringArray objectAtIndex:0]];
			
		}
		else
		{
			NSLog(@"%@ %@", [name substringToIndex:[name length]-(typeLength+1)],
				  [name substringFromIndex:[name length]-typeLength]);
			return [[NSBundle mainBundle]
					pathForResource:[name substringToIndex:[name length]-(typeLength+1)] 
					ofType:[name substringFromIndex:[name length]-typeLength]];
			
		}
	}
	else
	{
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
															 NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		return [documentsDirectory 
				stringByAppendingPathComponent:name];	
		
	}
}

@end
