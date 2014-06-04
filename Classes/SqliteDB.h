#import <Foundation/Foundation.h>

@class FMDatabase;
@class FMResultSet;

@interface SqliteDB : NSObject
+ (FMDatabase *)db;
+ (void)openDatabase;
+ (void)closeDatabase;

@end
