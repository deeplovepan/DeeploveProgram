//
//  PushNotificationEx.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/5/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

// Q: Resetting the Push Notifications Permissions Alert:
// A: The first time a push-enabled app registers for push notifications, iOS asks the  user if they wish to receive notifications for that app. Once the user has responded to this alert it is not presented again unless the device is restored or the app has been uninstalled for at least a day.
//  If you want to simulate a first-time run of your app, you can leave the app uninstalled for a day. You can achieve the latter without actually waiting a day by setting the system clock forward a day or more, turning the device off completely, then turning the device back on. 


// using urban airship API
// register ex:
// curl -X PUT -u "Lg6OVHoMQsezkPQy3utDgw:7kiyIYw6Rh6A4B31xNEfnA" 
// https://go.urbanairship.com/api/device_tokens/
//  bdd076692a89126ed3c5ea057f7c253534807d6f30c04fb67f01fcdd5bddcb7a/


#import "PushNotificationEx.h"


@implementation PushNotificationEx

@end
