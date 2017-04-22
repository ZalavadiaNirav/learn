//
//  buyFilterView.h
//  home
//
//  Created by Nirav Zalavadia on 24/03/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface buyFilterView : UIView <UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UIScrollView *buyFilterScrollVw;
@property (strong, nonatomic) IBOutlet UIView *buyFilterVw,*locationLbl;

//posted By

@property (strong, nonatomic) IBOutlet UIButton *ownerBtn;
@property (strong, nonatomic) IBOutlet UIButton *builderBtn;
@property (strong, nonatomic) IBOutlet UIButton *brokerBtn;

@property (strong,nonatomic) NSMutableArray *amenitiesArr;

- (IBAction)ownerAction:(id)sender;
- (IBAction)brokerAction:(id)sender;
- (IBAction)builderAction:(id)sender;

//Status

@property (strong, nonatomic) IBOutlet UIButton *underConstructionBtn;
@property (strong, nonatomic) IBOutlet UIButton *readyToMoveBtn;
- (IBAction)underConstructionAction:(id)sender;
- (IBAction)readyToMoveAction:(id)sender;

//Bedrooms

@property (strong, nonatomic) IBOutlet UIButton *bedroomsBtn;

- (IBAction)bedroomAction:(id)sender;
//Bathrooms

- (IBAction)bathroomAction:(id)sender;


//Amenities

@property (strong, nonatomic) IBOutlet UIView *amenitiesVw;
@property (strong, nonatomic) IBOutlet UILabel *amenitiesLbl;

@property (strong, nonatomic) IBOutlet UICollectionView *amenitiesCollectionvw;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *amenitiesHeightConstraints;

//Locality

@property (nonatomic,retain) NSMutableArray *localityArr;

@property (strong, nonatomic) IBOutlet UILabel *localityLbl;
@property (strong, nonatomic) IBOutlet UICollectionView *localityCollectionvw;


@end
