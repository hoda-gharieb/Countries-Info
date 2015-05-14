//
//  chosenCity.h
//  Project
//
//  Created by PiTechnologies on 5/13/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "countryDetail.h"
#import "MapView.h"

@interface chosenCity : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>


@property (nonatomic) countryDetail* c;
@property IBOutlet UILabel *cityname, *distance;
@property IBOutlet UITextView *descp;
@property IBOutlet UIImageView *imgV;

-(IBAction)showMap;


@end
