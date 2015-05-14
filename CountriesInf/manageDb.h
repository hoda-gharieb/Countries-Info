//
//  manageDb.h
//  Project
//
//  Created by PiTechnologies on 5/13/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface manageDb : UIViewController<NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic) DBManager* db;
- (IBAction)FillDB:(id)sender;
- (IBAction)ClearCache:(id)sender;

@end
