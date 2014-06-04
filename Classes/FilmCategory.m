#import "FilmCategory.h"

#import "FMDatabase.h"
#import "SqliteDB.h"

@implementation FilmCategory

- (id)initWithUid:(int)uid name:(NSString *)name {
    if ((self = [super init])) {
        _uid = uid;
        _name = name;
    }
    return self;
}

+ (NSArray *)allCategories {
    NSMutableArray *categories = [NSMutableArray array];
    FMDatabase *db = [SqliteDB db];
    FMResultSet *rs = [db executeQuery:@"SELECT uid, name FROM category"];
    while ([rs next]) {
        NSString *uid = [rs stringForColumnIndex:0];
        NSString *name = [rs stringForColumnIndex:1];
        FilmCategory *cat = [[FilmCategory alloc] initWithUid:[uid intValue] name:name];
        [categories addObject:cat];
    }
    [rs close];
    return categories;
}

@end
