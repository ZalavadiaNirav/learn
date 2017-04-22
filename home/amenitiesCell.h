//
//  amenitiesCell.h
//  home
//
//  Created by Nirav Zalavadia on 30/03/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface amenitiesCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIButton *amenitiesBtn;
@property (strong, nonatomic) IBOutlet UILabel *AmenitiesNameLbl;
- (IBAction)amenititesAction:(id)sender;

@end
