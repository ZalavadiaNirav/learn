//
//  localityCell.h
//  home
//
//  Created by Nirav Zalavadia on 14/04/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface localityCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIButton *localityBtn;
@property (strong, nonatomic) IBOutlet UILabel *localityLbl;

- (IBAction)localityAction:(id)sender;
@end
