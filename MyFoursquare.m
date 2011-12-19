//
//  MyFoursquare.m
//  IceCream
//
//  Created by  on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyFoursquare.h"
#import "MyWeb.h"

#define FOURSQUARE_SECRET @"HHGDT0ESKO030HZOIIJL2GKV2YZWTKXHQJPE52I2H5W32TGR"
#define FOURSQUARE_CLIENT_ID @"11CTXEX2NW1U45NBJ1FNVJYTEXAHEB0ZRBWLGNULTNSWJMTM"

@implementation MyFoursquare

@synthesize name;
@synthesize address;

// if no v parameter, the response will contain errorType deprecated
+(NSMutableArray*)getNearbyPlaceByCoordinate:(CLLocationCoordinate2D)coordinate
{
    NSString *url = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?ll=%f,%f&client_secret=%@&client_id=%@&v=30000101", coordinate.latitude, coordinate.longitude,
                     FOURSQUARE_SECRET, FOURSQUARE_CLIENT_ID]; 

    NSDictionary *dic = [MyWeb sendReqForUrlAndGetJsonDic:url postString:nil];
    NSArray *venueArray = [[dic objectForKey:@"response"] objectForKey:@"venues"];
    NSMutableArray *placeArray = nil;
    if(venueArray)
    {
        placeArray = [NSMutableArray array];
    }
    for(NSDictionary *dic in venueArray)
    {
        MyFoursquare *locInfo = [[MyFoursquare alloc] init];
        locInfo.name = [dic objectForKey:@"name"];
        locInfo.address = [[dic objectForKey:@"location"] objectForKey:@"address"];
        [placeArray addObject:locInfo];
    }
    return placeArray;
    
}

-(void)dealloc
{
    [name release];
    [address release];
    [super dealloc];
}

@end
