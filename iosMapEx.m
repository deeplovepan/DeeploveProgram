//
//  iosMapEx.m
//  DeeploveProgram
//
//  Created by Peter Pan on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "iosMapEx.h"

@implementation iosMapEx

/*
 /* get location distance  , unit: meter
 - (CLLocationDistance)distanceFromLocation:(const CLLocation *)location __OSX_AVAILABLE_STARTING(__MAC_10_6,__IPHONE_3_2);

*/

/*
    when there is no network, CLLocationManager can not get location update

*/


/*
    use different pin color
 
 - (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
 {
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] 
        initWithAnnotation:annotation reuseIdentifier:@"pin"];
 
    // for show title 
    annView.canShowCallout = YES;
    MyMapAnnotation *mapAnnotation = annotation;
    annView.pinColor = mapAnnotation.color;
    return annView;
 
 }

 
 
*/

@end
