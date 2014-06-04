//
//  Venue.h
//  EventBase
//
//  Created by Kyle Langille on 2014-05-31.
//  Copyright (c) 2014 Nik Macintosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Venue : NSObject

@property (nonatomic, readonly) int uid;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *address;
@property (nonatomic, readonly) NSString *lat;
@property (nonatomic, readonly) NSString *lng;


+ (NSArray *)allVenues;

@end
