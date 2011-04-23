//
//  MyMap.m
//  MyLib
//
//  Created by deeplove on 2010/10/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyMap.h"


@implementation MyMap

+(void)setMap:(MKMapView*)mapView coordinate:(CLLocationCoordinate2D)coordinate
latitudeDelta:(float)latitudeDelta longitudeDelta:(float)longitudeDelta
{
	MKCoordinateSpan mapSpan;
	MKCoordinateRegion mapRegion;
	mapRegion.center = coordinate;
	mapSpan.latitudeDelta = latitudeDelta;
	mapSpan.longitudeDelta = longitudeDelta;
	mapRegion.span = mapSpan;
	mapView.region = mapRegion;
	
}

@end
