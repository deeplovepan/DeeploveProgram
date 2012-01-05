//
//  MyMap.m
//  MyLib
//
//  Created by deeplove on 2010/10/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyMap.h"
#import "JSON.h"


@implementation MyMap

+(CLLocationCoordinate2D)getLatitudeAndLongtitudeByAddress:(NSString*)address
{
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude = INVALID_LATITUDE;
    coordinate.longitude = INVALID_LONGTITUDE;
    NSString *escapeAddr =  [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", escapeAddr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result)
    {
        NSString *status = [[result JSONValue] objectForKey:@"status"];
        if([status isEqualToString:@"OK"])
        {
            NSArray *resultArray =  [[result JSONValue] objectForKey:@"results"];
            NSDictionary *locDic = [resultArray objectAtIndex:0];
            NSDictionary *geometryDic = [locDic objectForKey:@"geometry"];
            NSDictionary *locationDic = [geometryDic objectForKey:@"location"];
            coordinate.latitude = [[locationDic objectForKey:@"lat"] floatValue];
            coordinate.longitude = [[locationDic objectForKey:@"lng"] floatValue];
            
        }
    }     
    
    return  coordinate;
}


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
