#import <Foundation/Foundation.h>

@class FilmCategory;

@interface Film : NSObject

@property (nonatomic, readonly) int uid;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *shortDesc;
@property (nonatomic, readonly) NSString *longDesc;
@property (nonatomic, readonly) int duration;
@property (nonatomic, readonly) NSString *thumbnailUrl;
@property (nonatomic, readonly) NSString *imageUrl;
@property (nonatomic, readonly) NSString *websiteUrl;
@property (nonatomic, readonly) int venue;

+ (NSArray *)filmsForCategory:(FilmCategory *)category;

@end
