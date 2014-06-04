#import "Film.h"

#import "FilmCategory.h"
#import "FMDatabase.h"
#import "SqliteDB.h"

@implementation Film

- (id)initWithUid:(int)uid
             name:(NSString *)name
        shortDesc:(NSString *)shortDesc
         longDesc:(NSString *)longDesc
         duration:(int)duarion
     thumbnailUrl:(NSString *)thumbnailUrl
         imageUrl:(NSString *)imageUrl
       websiteUrl:(NSString *)websiteUrl
            venue:(int)venue
{
    if ((self = [super init])) {
        _name = name;
        _shortDesc = shortDesc;
        _longDesc = longDesc;
        _duration = duarion;
        _thumbnailUrl = thumbnailUrl;
        _imageUrl = imageUrl;
        _websiteUrl = websiteUrl;
        _venue = venue;
    }
    return self;
}

+ (NSArray *)filmsForCategory:(FilmCategory *)category {
    NSMutableArray *films = [NSMutableArray array];
    FMDatabase *db = [SqliteDB db];
    FMResultSet *rs = [db executeQuery:@"SELECT uid, name, duration, thumbnail_url, image_url, website_url, short_desc, venue_uid desc FROM movie WHERE categories LIKE ?" withArgumentsInArray:@[[NSString stringWithFormat:@"%%%@%%",[NSNumber numberWithInt:category.uid]]]];
    while ([rs next]) {
        NSString *uid = [rs stringForColumnIndex:0];
        NSString *name = [rs stringForColumnIndex:1];
        NSString *duration = [rs stringForColumnIndex:2];
        NSString *thumbnail_url = [rs stringForColumnIndex:3];
        NSString *image_url = [rs stringForColumnIndex:4];
        NSString *website_url = [rs stringForColumnIndex:5];
        NSString *short_desc = [rs stringForColumnIndex:6];
        NSString *venue = [rs stringForColumnIndex:7];
        
        
        Film *cat = [[Film alloc] initWithUid:[uid intValue]
                                                 name:name shortDesc:short_desc
                                     longDesc:nil
                                     duration:[duration intValue]
                                 thumbnailUrl:thumbnail_url
                                     imageUrl:image_url
                                   websiteUrl:website_url venue:[venue intValue]];
        [films addObject:cat];
    }
    [rs close];
    return films;
}

@end
