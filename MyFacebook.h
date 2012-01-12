//
//  MyFacebook.h
//  FacebookTest
//
//  Created by deeplove on 2011/5/14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBConnect.h"


@interface MyFacebook : NSObject <FBSessionDelegate, FBRequestDelegate>{
    Facebook *facebook;

}
@property (nonatomic, retain) Facebook *facebook;

-(void)login;
-(void)publish:(NSString*)msg picLink:(NSString*)picLink;
-(void)logout;
-(BOOL)isUserLogin;

@end
