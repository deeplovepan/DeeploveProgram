//
//  MyFacebook.m
//  FacebookTest
//
//  Created by deeplove on 2011/5/14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyFacebook.h"

// customized
#define FACEBOOK_APP_ID @"161469353888124"

#define ACCESS_TOKEN_KEY @"fb_access_token"
#define EXPIRATION_DATE_KEY @"fb_expiration_date"


@implementation MyFacebook

@synthesize facebook;

-(void)logout
{
    [facebook logout:self];
}

-(void)publish:(NSString*)msg picLink:(NSString*)picLink
{
   
    NSMutableDictionary * params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    msg, @"message",
                                    picLink, @"picture",
                                    nil];
    [facebook requestWithGraphPath:@"me/feed" andParams:params andHttpMethod:@"POST" andDelegate:self];

}

-(BOOL)isUserLogin
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   
    if([defaults objectForKey:ACCESS_TOKEN_KEY])
    {
        return  YES;
    }
    else
    {
        return NO;
    }
}

/*
-(void)like:(NSString*)objId
{
   
    NSString *path = [NSString stringWithFormat:@"%@/likes", objId];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [facebook requestWithGraphPath:path andParams:dic andHttpMethod:@"POST" andDelegate:self];
    [dic release];
}
*/

-(void)login
{
    if ([facebook isSessionValid] == NO)
    {
        // signin the user and prompt the user to authorize the app
        // offline_access can prevent access token out of date
        NSArray *permissions = [NSArray arrayWithObjects:@"offline_access", 
                                @"publish_stream", nil];
        [facebook authorize:permissions delegate:self];
    }
   

}

-(id)init
{
    self = [super init];
    if(self)
    {
        facebook = [[Facebook alloc] initWithAppId:FACEBOOK_APP_ID];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        facebook.accessToken = [defaults objectForKey:ACCESS_TOKEN_KEY];
        facebook.expirationDate = [defaults objectForKey:EXPIRATION_DATE_KEY];
    }
    return self;
        
}

-(void)dealloc
{
    [facebook release];
    [super dealloc];
}

#pragma mark - FBRequestDelegate
- (void)request:(FBRequest *)request didFailWithError:(NSError *)error;
{
    NSLog(@"request fail %@", error);
}

- (void)request:(FBRequest *)request didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"request didReceiveResponse %@", response);
    
}

- (void)request:(FBRequest *)request didLoad:(id)result
{
    NSLog(@"request didLoad %@", result);
}

#pragma mark - FBSessionDelegate

-(void)fbDidLogin
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:facebook.accessToken forKey:ACCESS_TOKEN_KEY];
    [defaults setObject:facebook.expirationDate forKey:EXPIRATION_DATE_KEY];
    [defaults synchronize];
}

- (void)fbDidLogout
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:ACCESS_TOKEN_KEY];
    [defaults removeObjectForKey:EXPIRATION_DATE_KEY];
    [defaults synchronize];
}

@end
