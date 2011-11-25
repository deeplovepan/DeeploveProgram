//
//  DeeploveTimeLib.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DeeploveTimeLib : NSObject {
    
}
+(NSDate*)getDateFromYear:(int)year month:(int)month day:(int)day
                     hour:(int)hour minute:(int)minute second:(int)second;
+(int)getGMTOffsetInHourOnDevice;
+(NSString*)getTimeStrFromDate:(NSDate*)date;
+(int)getHour:(NSDate*)date;
+(int)getMin:(NSDate*)date;

@end
