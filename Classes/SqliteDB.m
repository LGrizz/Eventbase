#import "SqliteDB.h"

#import "FMDatabase.h"

@implementation SqliteDB

static FMDatabase *_db = nil;

+ (FMDatabase *)db {
    return _db;
}

+ (void)openDatabase {
    if (_db)
        [self closeDatabase];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"EventBase" ofType:@"sqlite"];
    _db = [[FMDatabase alloc] initWithPath:path];
    _db.logsErrors = YES;
    [_db open];
    
    if (![_db goodConnection]) {
        NSLog(@"Failed to load database");
    }
}

+ (void)closeDatabase {
    [_db close];
}

@end
