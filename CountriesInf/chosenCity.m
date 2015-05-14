//
//  chosenCity.m
//  Project
//
//  Created by PiTechnologies on 5/13/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "chosenCity.h"

@interface chosenCity ()

@end

@implementation chosenCity

@synthesize descp,distance,cityname,imgV;

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
    [cityname setText:c.city];
    [descp setText:c.desc];
    [imgV setImage:[UIImage imageNamed:c.img]];
    
    CLLocationManager *mgr = [CLLocationManager new];
    [mgr setDesiredAccuracy:kCLLocationAccuracyKilometer];
    [mgr setDelegate:self];
    [mgr startUpdatingLocation];
    
    CLLocation *currentLoc = [[CLLocation alloc] initWithLatitude:mgr.location.coordinate.latitude longitude:mgr.location.coordinate.longitude];
    
    CLLocation *cityloc = [[CLLocation alloc] initWithLatitude:c.lat longitude:c.lon];
    
    CLLocationDistance meters = [cityloc distanceFromLocation:currentLoc];
    distance.text = [NSString stringWithFormat:@"%.8f", meters];
}

-(IBAction)showMap
{
    MapView *page = [MapView new];
    page.title = c.city;
    page.c = [countryDetail new];
    page.c = [self c];
    [self.navigationController pushViewController:page animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
