//
//  manageDb.m
//  Project
//
//  Created by PiTechnologies on 5/13/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "manageDb.h"

@interface manageDb ()

@property NSArray *AllCountriesdata;

@end

@implementation manageDb

@synthesize db;

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
    
    NSURL *url = [NSURL URLWithString:@"http://localhost/getCountries.json"];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    [conn start];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    _AllCountriesdata = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)FillDB:(id)sender {
    
    for (int i = 0; i < _AllCountriesdata.count; i++)
    {
        NSDictionary *country = [_AllCountriesdata objectAtIndex:i];
        
        countryDetail* cd = [countryDetail new];
        cd.ID = [country objectForKey:@"Countryid"];
        cd.country = [country objectForKey:@"Country"];
        cd.city = [country objectForKey:@"city"];
        cd.desc = [country objectForKey:@"holidays"];
        cd.img = [country objectForKey:@"image"];
        cd.lat = [[country objectForKey:@"Lat"] doubleValue];
        cd.lon = [[country objectForKey:@"Lon"]  doubleValue];
        
        //@"SELECT id, country, city, description, img, lat, long FROM empInf"
        NSString *q = [NSString stringWithFormat:@"INSERT into countries(cid,country,city,holiday,img,lat,long) values ('%@','%@','%@','%@','%@','%@','%@')",cd.ID, cd.country, cd.city, cd.desc,cd.img,[NSString stringWithFormat:@"%f",cd.lat],[NSString stringWithFormat:@"%f",cd.lon]];
         NSLog(@"%@",q);
        NSLog(@"%@",cd.desc);
        [db runQuery:[q UTF8String] isQueryExecutable:true];
       
    }
    
    printf("DB read!\n");
}

- (IBAction)ClearCache:(id)sender {
    
    NSString *q = [NSString stringWithFormat:@"DELETE from countries"];
    [db runQuery:[q UTF8String] isQueryExecutable:true];

    printf("DB deleted!\n");
}
@end
