#import "FilmCell.h"

#import "AFNetworking.h"
#import "Film.h"

@implementation FilmCell {
    Film *_film;
}

- (id)initWithFilm:(Film *)film reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        _film = film;
        self.textLabel.font = [UIFont boldSystemFontOfSize:15];
        self.detailTextLabel.font = [UIFont systemFontOfSize:12];
        self.detailTextLabel.numberOfLines = 2;
        
        self.textLabel.text = _film.name;
        self.detailTextLabel.text = _film.shortDesc;
        
        UILabel *durationLabel = [[UILabel alloc] initWithFrame:CGRectMake(83, 60, 120, 20)];
        durationLabel.font = [UIFont systemFontOfSize:12];
        durationLabel.text = [NSString stringWithFormat:@"Duration: %d", film.duration];
        [self addSubview:durationLabel];
        
        NSString *url = _film.thumbnailUrl;
        AFHTTPRequestOperation *postOperation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
        postOperation.responseSerializer = [AFImageResponseSerializer serializer];
        [postOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            self.imageView.image = responseObject;
            [self setNeedsLayout];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Image error: %@", error);
        }];
        [postOperation start];
    }
    
    return self;
}

@end
