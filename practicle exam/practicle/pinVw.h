//
//  pinVw.h
//  practicle
//
//  Created by Nirav Zalavadia on 08/04/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface pinVw : NSObject <MKAnnotation>



@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,readwrite)CLLocationCoordinate2D coordinate;


@end
