//
//  table1.m
//  SQLITE_DB_SAMPLE
//
//  Created by PiTechnologies on 5/3/15.
//  Copyright (c) 2015 imaamoun. All rights reserved.
//

#import "table1.h"

@interface table1 ()

@end

@implementation table1

@synthesize arr, arrData, db;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arr = [NSMutableArray new];
    arrData = [NSMutableArray new];
    db = [DBManager new];
    db = [db initWithFileName:@"trial"];
    [self ready];
}

-(void)ready
{
    arr = [NSMutableArray new];
    arrData = [NSMutableArray new];
    NSString *q = @"SELECT * FROM countries";
    arrData = [db runQuery:[q UTF8String] isQueryExecutable:false];
    for( int i=0 ; i<arrData.count ; i++ )
    {
        countryDetail *p = [arrData objectAtIndex:i];
        [arr addObject:p.country];
    }
}

-(void) viewWillAppear:(BOOL)animated //for reloading the data
{
    [self ready];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
////warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [arr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = arr[indexPath.row];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(IBAction)dbmanagement
{
    manageDb *page = [manageDb new];
    page.title = @"Manage Database";
    page.db = [DBManager new];
    page.db = self.db;
    [self.navigationController pushViewController:page animated:YES];
    [self ready];
}


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    chosenCity *page = [chosenCity new];
    page.title = [arrData[indexPath.row] country];
    page.c = [countryDetail new];
    page.c = arrData[indexPath.row];
    [self.navigationController pushViewController:page animated:YES];
}
 


@end
