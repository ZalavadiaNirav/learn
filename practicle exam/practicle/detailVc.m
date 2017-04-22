//
//  detailVc.m
//  practicle
//
//  Created by Nirav Zalavadia on 08/04/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import "detailVc.h"

@interface detailVc ()

@end

@implementation detailVc
@synthesize coordinate,lonStr,latStr;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CLLocationCoordinate2D coordinate1=CLLocationCoordinate2DMake([self.latStr floatValue],[self.lonStr floatValue]);

    objpin=[[pinVw alloc] init];
    objpin.title=@"Pin1";
    objpin.subtitle=@"Subtitle";
    objpin.coordinate=coordinate1;
    
    _mapVw.delegate=self;
    
    MKCoordinateSpan span=MKCoordinateSpanMake(1.0, 1.0);
    MKCoordinateRegion region=MKCoordinateRegionMake(coordinate1, span);
    
    [_mapVw setRegion:region animated:YES];
    [_mapVw addAnnotation:objpin];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
