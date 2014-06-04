//
//  Venue.m
//  EventBase
//
//  Created by Kyle Langille on 2014-05-31.
//  Copyright (c) 2014 Nik Macintosh. All rights reserved.
//

#import "Venue.h"
#import "FMDatabase.h"
#import "SqliteDB.h"

@implementation Venue

- (id)initWithUid:(int)uid name:(NSString *)name address:(NSString *)address lat:(NSString *)lat lng:(NSString *)lng{
    if ((self = [super init])) {
        _uid = uid;
        _name = name;
        _address = address;
        _lat = lat;
        _lng = lng;
    }
    return self;
}

+ (NSArray *)allVenues {
    NSMutableArray *venues = [NSMutableArray array];
    FMDatabase *db = [SqliteDB db];
    FMResultSet *rs = [db executeQuery:@"SELECT lat, lng, uid, name, address FROM venue"];
    while ([rs next]) {
        NSString *lat = [rs stringForColumnIndex:0];
        NSString *lng = [rs stringForColumnIndex:1];
        NSString *uid = [rs stringForColumnIndex:2];
        NSString *name = [rs stringForColumnIndex:3];
        NSString *address = [rs stringForColumnIndex:4];
        Venue *cat = [[Venue alloc] initWithUid:[uid intValue] name:name address:address lat:lat lng:lng];
        [venues addObject:cat];
    }
    [rs close];
    return venues;
}

@end
