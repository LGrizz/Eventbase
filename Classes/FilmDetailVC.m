#import "FilmDetailVC.h"
#import "UIImageView+AFNetworking.h"
#import "VenueVC.h"

@interface FilmDetailVC ()

@property (nonatomic, readonly) UIButton *button;
@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UILabel *label;

@end

@implementation FilmDetailVC

@synthesize button = _button;
@synthesize imageView = _imageView;
@synthesize label = _label;

#pragma mark - FilmDetailVC

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [_button setTitle:NSLocalizedString(@"Venue", nil) forState:UIControlStateNormal];
        [_button sizeToFit];
        [_button addTarget:self action:@selector(goToVenue) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}

- (void)goToVenue{
    VenueVC *vc = [[VenueVC alloc] initWithVenue:_film.venue];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_film.imageUrl]];
        
        [_imageView setImageWithURLRequest:request placeholderImage:Nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            _imageView.bounds = ({
                CGRect bounds = _imageView.bounds;
                
                bounds.size = CGSizeMake(image.size.width / 2, image.size.height / 2);
                bounds;
            });
            _imageView.image = image;
            
            [_imageView setNeedsLayout];
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            NSLog(@"%@", error);
        }];
    }
    
    return _imageView;
}

- (UILabel *)label{
    if (!_label) {
        CGFloat width = CGRectInset(self.view.bounds, 10.f, 0.f).size.width;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, width, CGRectGetHeight(self.view.bounds) / 4)];
        
        _label.numberOfLines = 0;
        _label.preferredMaxLayoutWidth = width;
        _label.text = _film.shortDesc;
        _label.textAlignment = NSTextAlignmentCenter;
    }
    
    return _label;
}

- (id)initWithFilm:(Film *)film {
    if ((self = [super init])) {
        _film = film;
    }
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.imageView.center = ({
        CGPoint center = self.imageView.center;
        
        center.x = self.view.center.x;
        center;
    });
    self.imageView.frame = ({
        CGRect frame = self.imageView.frame;
        
        frame.origin.y = 10.f;
        frame;
    });
    
    [self.label sizeToFit];
    self.label.center = self.view.center;
    
    self.button.center = ({
        CGPoint center = self.button.center;
        
        center.x = self.view.center.x;
        center;
    });
    self.button.frame = ({
        CGRect frame = self.button.frame;
        
        frame.origin.y = CGRectGetHeight(self.view.bounds) * 3 / 4;
        frame;
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (UIView *view in @[ self.imageView, self.label, self.button ]) {
        [self.view addSubview:view];
    }
        
    self.title = _film.name;
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
