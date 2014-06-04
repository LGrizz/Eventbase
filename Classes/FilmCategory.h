#import <Foundation/Foundation.h>

@interface FilmCategory : NSObject
@property (nonatomic, readonly) int uid;
@property (nonatomic, readonly) NSString *name;

+ (NSArray *)allCategories;
@end
