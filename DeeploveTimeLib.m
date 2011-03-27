//
//  DeeploveTimeLib.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DeeploveTimeLib.h"


@implementation DeeploveTimeLib

+(NSDate*)getDateFromYear:(int)year month:(int)month day:(int)day
                     hour:(int)hour minute:(int)minute second:(int)second
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:year];
    [dateComponents setMonth:month];
    [dateComponents setDay:day];
    [dateComponents setHour:hour];
    [dateComponents setMinute:minute];
    [dateComponents setSecond:second];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDate *date = [calendar dateFromComponents:dateComponents];
    [dateComponents release];
    return date;
}


@end
