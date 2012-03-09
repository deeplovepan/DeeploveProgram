//
//  MyAnnotation.h
//  MapLocation
//
//  Created by  on 11/10/24.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyMapAnnotation : NSObject <MKAnnotation>

@property (assign, nonatomic) int color;

-(id)initWithCoordinate:(CLLocationCoordinate2D)argCoordinate title:(NSString*)argTitle subtitle:(NSString*)argSubtitle color:(int)argColor;

@end
