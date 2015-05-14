//
//  MapView.h
//  Project
//
//  Created by PiTechnologies on 5/13/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "countryDetail.h"

@interface MapView : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic)countryDetail *c;
@property (strong, nonatomic) IBOutlet MKMapView *MapView;

@end
