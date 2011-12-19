//
//  MyFoursquare.h
//  IceCream
//
//  Created by  on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MyFoursquare : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *address;

+(NSMutableArray*)getNearbyPlaceByCoordinate:(CLLocationCoordinate2D)coordinate;

@end
