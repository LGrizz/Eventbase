#import <UIKit/UIKit.h>

@class Film;

@interface FilmCell : UITableViewCell
- (id)initWithFilm:(Film *)film reuseIdentifier:(NSString *)reuseIdentifier;
@end
