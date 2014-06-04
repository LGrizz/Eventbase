//
//  VenueVC.m
//  EventBase
//
//  Created by Kyle Langille on 2014-05-31.
//  Copyright (c) 2014 Nik Macintosh. All rights reserved.
//

#import "VenueVC.h"
#import "Venue.h"

@interface VenueVC ()

@property (nonatomic, readonly) UILabel *nameLabel;
@property (nonatomic, readonly) UILabel *addressLabel;

@end

@implementation VenueVC{
    NSArray *_venues;
    Venue *_venue;
    MKMapView *_mapView;
}

@synthesize nameLabel = _nameLabel;
@synthesize addressLabel = _addressLabel;

- (MKMapView *)_mapView{
    if (!_mapView) {
        _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(20.f, 150.f, 280.0f, 200.0f)];
        CLLocationCoordinate2D startCoord = CLLocationCoordinate2DMake([_venue.lat floatValue], [_venue.lng floatValue]);
        MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:MKCoordinateRegionMakeWithDistance(startCoord, 2000, 2000)];
        [_mapView setRegion:adjustedRegion animated:YES];
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        [annotation setCoordinate:startCoord];
        [annotation setTitle:_venue.name];
        [_mapView addAnnotation:annotation];
    }
    
    return _mapView;
}

- (UILabel *)_nameLabel{
    if (!_nameLabel) {
        CGFloat width = CGRectInset(self.view.bounds, 10.f, 0.f).size.width;
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.f, 80.f, width, CGRectGetHeight(self.view.bounds) / 4)];
        
        _nameLabel.numberOfLines = 0;
        _nameLabel.preferredMaxLayoutWidth = width;
        _nameLabel.text = _venue.name;
        _nameLabel.font = [UIFont systemFontOfSize:14.0f];
    }
    
    return _nameLabel;
}

- (UILabel *)_addressLabel{
    if (!_addressLabel) {
        CGFloat width = CGRectInset(self.view.bounds, 10.f, 0.f).size.width;
        
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.f, 110.f, width, CGRectGetHeight(self.view.bounds) / 4)];
        
        _addressLabel.numberOfLines = 0;
        _addressLabel.preferredMaxLayoutWidth = width;
        _addressLabel.text = _venue.address;
        _addressLabel.font = [UIFont systemFontOfSize:12.0f];
    }
    
    return _addressLabel;
}

-(id)initWithVenue:(int)venueIndex{
    self = [super init];
    if(self) {
        _venues = [Venue allVenues];
        _venue = [_venues objectAtIndex:venueIndex];
    }
    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self._nameLabel sizeToFit];
    [self._addressLabel sizeToFit];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (UIView *view in @[self._nameLabel, self._addressLabel, self._mapView]) {
        [self.view addSubview:view];
    }
    
    self.title = @"Venue";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
