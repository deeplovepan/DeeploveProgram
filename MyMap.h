//
//  MyMap.h
//  MyLib
//
//  Created by deeplove on 2010/10/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyMap : NSObject {

}
+(void)setMap:(MKMapView*)mapView coordinate:(CLLocationCoordinate2D)coordinate
latitudeDelta:(float)latitudeDelta longitudeDelta:(float)longitudeDelta;

@end
