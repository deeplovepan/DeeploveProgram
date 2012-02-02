//
//  DeeploveTimeLib.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyTimeLib.h"

#define ISO_TIMEZONE_UTC_FORMAT @"Z"
#define ISO_TIMEZONE_OFFSET_FORMAT @"+%f:%f"

// date format
/*
 HH: show hour , unit 24 hour 
 hh: show hour , unit 12 hour 
 MM: show month number, ex 01, 02
 M: show month number, ex 1, 2
 */

@implementation MyTimeLib

+(NSString*)getHourMinSecondStrFromSecond:(int)second
{
    int mins = second/60;
    int hours = second/3600;
    int seconds = second-hours*3600-mins*60;
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, mins, seconds];
}

+(NSString *)getISO8601Str:(NSDate *)date {
    static NSDateFormatter* sISO8601 = nil;
    
    if (!sISO8601) {
        sISO8601 = [[NSDateFormatter alloc] init];
        
        NSTimeZone *timeZone = [NSTimeZone localTimeZone];
        int offset = [timeZone secondsFromGMT];
        
        NSMutableString *strFormat = [NSMutableString stringWithString:@"yyyyMMdd'T'HH:mm:ss"];
        offset /= 60; //bring down to minutes
        if (offset == 0)
            [strFormat appendString:ISO_TIMEZONE_UTC_FORMAT];
        else
            [strFormat appendFormat:ISO_TIMEZONE_OFFSET_FORMAT, offset / 60, offset % 60];
        
        [sISO8601 setTimeStyle:NSDateFormatterFullStyle];
        [sISO8601 setDateFormat:strFormat];
    }
    return[sISO8601 stringFromDate:date];
}


+(NSString*)getTimeStrFromDate:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeStr = [dateFormatter stringFromDate:date];
    [dateFormatter release];
    return timeStr;
}

+(NSString*)getRFC1123TimeStrFromDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone: [NSTimeZone timeZoneWithName: @"GMT"]];
    formatter.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];  
    [formatter setDateFormat: @"EEE, dd MMM yyyy HH:mm:ss"];
    NSString *dateString = [[formatter stringFromDate: date] stringByAppendingString:@" GMT"];
    [formatter release];
    return dateString;
    
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
