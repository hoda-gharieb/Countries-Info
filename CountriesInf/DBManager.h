//
//  DBManager.h
//  SQLITE_DB_SAMPLE
//
//  Created by imaamoun on 4/28/15.
//  Copyright (c) 2015 imaamoun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "countryDetail.h"
@interface DBManager : NSObject

@property (nonatomic,strong) NSString *dbFilePath;

-(instancetype)initWithFileName :(NSString *)dbname;

-(NSMutableArray*)runQuery:(const char*)query isQueryExecutable:(BOOL)queryExecutable;
-(void)copyDatabaseInDocumentDirectory;

-(NSString*) getentry :(sqlite3_stmt*)statment :(int)col;
@end
