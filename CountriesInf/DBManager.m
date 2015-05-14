//
//  DBManager.m
//  SQLITE_DB_SAMPLE
//
//  Created by imaamoun on 4/28/15.
//  Copyright (c) 2015 imaamoun. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager

-(instancetype)initWithFileName :(NSString *)dbname
{
    self=[super init];
    if (self) {
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *documentDirectory=[paths objectAtIndex:0];
        
        _dbFilePath=[documentDirectory stringByAppendingPathComponent:dbname];
        [self copyDatabaseInDocumentDirectory];
    }
    return self;
}

-(void)copyDatabaseInDocumentDirectory
{
    NSString *bundleFilePath=[[NSBundle mainBundle]pathForResource:@"trial" ofType:@"sqlite3"];
   
    if ([[NSFileManager defaultManager] fileExistsAtPath:bundleFilePath]) {
        NSError *error;
        [[NSFileManager defaultManager]copyItemAtPath:bundleFilePath toPath:_dbFilePath error:&error];
        
        if (error!=nil) {
            NSLog(@"%@",[error localizedDescription]);
        }
    }
}

-(NSString*) getentry :(sqlite3_stmt*)statment :(int)col //for accessing db columns
{
    char *str=(char*)sqlite3_column_text(statment, col);
    NSString *idd= [ [NSString alloc] initWithUTF8String:str];
    return idd;
}

-(NSMutableArray*)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable
{
    sqlite3 *database;
    NSMutableArray *arr = [NSMutableArray new];
   BOOL isOPened = sqlite3_open([_dbFilePath UTF8String], &database);
    
    if (isOPened == SQLITE_OK) {
        
        sqlite3_stmt *statment;
        
      BOOL prepared = sqlite3_prepare_v2(database, query, -1, &statment, NULL);
        
        if (prepared == SQLITE_OK) {
            
            if (!queryExecutable) {
                
                while (sqlite3_step(statment)==SQLITE_ROW) {
                    countryDetail *p = [countryDetail new];
                    p.ID = [self getentry:statment :1];
                    p.country = [self getentry:statment :2];
                    p.city = [self getentry:statment :3];
                    p.desc = [self getentry:statment :4];
                    p.img = [self getentry:statment :5];
                    p.lat = [[self getentry:statment :6] floatValue];
                    p.lon = [[self getentry:statment :7] floatValue];
                    [arr addObject:p];
                    
                }
            }
        
            else
            {
                if (sqlite3_step(statment)==SQLITE_DONE) {
                    
                    int affected_row=sqlite3_changes(database);
                    NSLog (@"%d  row inserted",affected_row);
                    
                   long long lastId=  sqlite3_last_insert_rowid(database);
                    
                    NSLog(@"%lld",lastId);
                }
                sqlite3_finalize(statment);
            }
            
        }
        else
            NSLog(@"%s",sqlite3_errmsg(database));
    }
  else
    NSLog(@"%s",sqlite3_errmsg(database));
    return arr;

}

@end
/*
 // Execute the query.
 BOOL executeQueryResults = sqlite3_step(compiledStatement);
 if (executeQueryResults == SQLITE_DONE) {
 // Keep the affected rows.
 self.affectedRows = sqlite3_changes(sqlite3Database);
 
 // Keep the last inserted row ID.
 self.lastInsertedRowID = sqlite3_last_insert_rowid(sqlite3Database);
 }
 else
 {
 // If could not execute the query show the error message on the debugger.
 NSLog(@"DB Error: %s", sqlite3_errmsg(sqlite3Database));
 }
 }
 }
 else {
 // In the database cannot be opened then show the error message on the debugger.
 NSLog(@"%s", sqlite3_errmsg(sqlite3Database));
 }
 
 // Release the compiled statement from memory.
 sqlite3_finalize(compiledStatement);
 
	}
 */