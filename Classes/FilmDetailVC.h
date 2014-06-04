#import <UIKit/UIKit.h>

#include "Film.h"

@interface FilmDetailVC : UIViewController
@property (nonatomic, strong) Film *film;

- (id)initWithFilm:(Film *)film;

@end
