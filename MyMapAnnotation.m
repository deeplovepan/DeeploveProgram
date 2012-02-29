//
//  MyAnnotation.m
//  MapLocation
//
//  Created by  on 11/10/24.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyMapAnnotation.h"

@implementation MyMapAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)argCoordinate title:(NSString*)argTitle subtitle:(NSString*)argSubtitle
{
    self = [super init];
    if(self)
    {
        coordinate = argCoordinate;
        title = argTitle;
        subtitle = argSubtitle;
    }
    return self;
}

@end
