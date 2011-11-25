//
//  DeeploveTimeLib.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DeeploveTimeLib.h"


@implementation DeeploveTimeLib

+(NSString*)getTimeStrFromDate:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeStr = [dateFormatter stringFromDate:date];
    [dateFormatter release];
    return timeStr;
}

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

+(int)getGMTOffsetInHourOnDevice
{
    NSTimeZone *currentTimeZone = [NSTimeZone localTimeZone];
    return [currentTimeZone secondsFromGMT];
}

+(int)getHour:(NSDate*)date 
{
    NSDate *now = date;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    return [components hour];
}

+(int)getMin:(NSDate*)date 
{
    NSDate *now = date;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:kCFCalendarUnitMinute fromDate:now];
    
    return [components minute];
}

@end
