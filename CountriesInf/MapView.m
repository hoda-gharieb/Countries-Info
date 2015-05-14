//
//  MapView.m
//  Project
//
//  Created by PiTechnologies on 5/13/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "MapView.h"

@interface MapView ()

@end

@implementation MapView

@synthesize c;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    
    [annotation setCoordinate:CLLocationCoordinate2DMake(c.lat, c.lon)];
    [annotation setTitle:c.city];
    [_MapView addAnnotation:annotation];
    [_MapView setDelegate:self];
    

    
    //set location
    /*CLLocationManager *mgr = [CLLocationManager new];
    [mgr setDesiredAccuracy:kCLLocationAccuracyKilometer];
    [mgr setDelegate:self];
    [mgr startUpdatingLocation];
    
    CLLocation *currentLoc = [[CLLocation alloc] initWithLatitude:mgr.location.coordinate.latitude longitude:mgr.location.coordinate.longitude];
    
    CLLocation *cityloc = [[CLLocation alloc] initWithLatitude:self.chosencitylat longitude:self.chosencitylon];
    
    CLLocationDistance meters = [cityloc distanceFromLocation:currentLoc];
    _Disttxt.text = [NSString stringWithFormat:@"%.8f", meters];*/
    
    
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pav = [ [MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
    NSLog(@"entered");
    pav.pinColor = MKPinAnnotationColorRed;
    return pav;
}

/*
- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    [_MapView setCenterCoordinate:[[locations lastObject] coordinate] animated:YES];
    
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    annotation.coordinate = CLLocationCoordinate2DMake([[locations lastObject] coordinate].latitude, [[locations lastObject] coordinate].longitude);
    
    [_MapView addAnnotation:annotation];
   
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
