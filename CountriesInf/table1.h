//
//  table1.h
//  SQLITE_DB_SAMPLE
//
//  Created by PiTechnologies on 5/3/15.
//  Copyright (c) 2015 imaamoun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "manageDb.h"
#import "chosenCity.h"
#import "countryDetail.h"
#import "DBManager.h"

@interface table1 : UITableViewController

@property NSMutableArray *arr, *arrData;
@property (nonatomic) DBManager *db;

-(IBAction)dbmanagement;
@end
