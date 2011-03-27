//
//  LocalNotificationEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/3/19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LocalNotificationEx.h"


@implementation LocalNotificationEx


-(void)showLocalNotificationNow
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    if(localNotification != nil)
    {
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.alertBody = [NSString stringWithFormat:@"hello"];
        localNotification.alertAction = NSLocalizedString(@"View Details", nil);
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.applicationIconBadgeNumber = 1;
        
        NSDictionary *infoDic = [NSDictionary dictionaryWithObject:@"peter" forKey:@"name"];
        localNotification.userInfo = infoDic;
        [[UIApplication sharedApplication] presentLocalNotificationNow:
         localNotification];
        [localNotification release];
    }
    
}

-(void)scheduleLocalNotification
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    if(localNotification != nil)
    {
        NSDate *date = [DeeploveTimeLib getDateFromYear:2011 month:3 day:19
                                                   hour:22 minute:36 second:30];
        localNotification.fireDate = date;
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.alertBody = [NSString stringWithFormat:@"hello"];
        localNotification.alertAction = NSLocalizedString(@"View Details", nil);
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.applicationIconBadgeNumber = 1;
        
        NSDictionary *infoDic = [NSDictionary dictionaryWithObject:@"peter" forKey:@"name"];
        localNotification.userInfo = infoDic;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        [localNotification release];
    }
}

@end
