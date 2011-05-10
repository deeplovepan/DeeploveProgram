//
//  MyMapAnnotation.m
//  MyLib
//
//  Created by deeplove on 2010/9/11.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyMapAnnotation.h"


@implementation MyMapAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;



-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate=c;
	return self;
}

-(void)dealloc
{
	[title release];
	[subtitle release];
	[super dealloc];
}

@end
