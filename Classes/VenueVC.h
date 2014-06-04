//
//  VenueVC.h
//  EventBase
//
//  Created by Kyle Langille on 2014-05-31.
//  Copyright (c) 2014 Nik Macintosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface VenueVC : UIViewController <MKMapViewDelegate>

-(id)initWithVenue:(int)venueIndex;

@end
