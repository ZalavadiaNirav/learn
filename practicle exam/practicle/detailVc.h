//
//  detailVc.h
//  practicle
//
//  Created by Nirav Zalavadia on 08/04/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "pinVw.h"

@interface detailVc : UIViewController <MKMapViewDelegate,MKAnnotation>
{
    pinVw *objpin;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapVw;
@property (nonatomic,retain) NSString *latStr,*lonStr;
@property (weak) id <MKAnnotation> delegate;


@end
