//
//  MyNotification.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyNotification.h"


@implementation MyNotification

+(void)scheduleLocalNotification:(NSString*)text atDate:(NSDate*)date
badgeNumber:(int)badgeNumber
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    if(localNotification != nil)
    {
        localNotification.fireDate = date;
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.alertBody = text;
        localNotification.alertAction = NSLocalizedString(@"View Details", nil);
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        localNotification.applicationIconBadgeNumber = badgeNumber;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
        [localNotification release];
    }
}

@end
