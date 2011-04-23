//
//  MyNotification.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyNotification : NSObject {
    
}
+(void)scheduleLocalNotification:(NSString*)text atDate:(NSDate*)date
                     badgeNumber:(int)badgeNumber;

@end
