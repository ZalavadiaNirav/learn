//
//  BuyFilterViewController.h
//  home
//
//  Created by Nirav Zalavadia on 15/03/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MARKRangeSlider.h"
#import "buyFilterView.h"

@interface BuyFilterViewController : UIViewController <UIScrollViewDelegate>
{
    MARKRangeSlider *rangeSlider;
    buyFilterView *filterScreen;
}

@property (strong, nonatomic) IBOutlet UISegmentedControl *propertySeg;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollVw;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong,nonatomic) UIButton *compassBtn;
@property (nonatomic,retain) MARKRangeSlider *rangeSlider;

//property type

@property (strong, nonatomic) IBOutlet UIButton *apartmentBtn;
@property (strong, nonatomic) IBOutlet UIButton *houseVillaBtn;
@property (strong, nonatomic) IBOutlet UIButton *rowHouseBtn;
@property (strong, nonatomic) IBOutlet UIButton *plotBtn;

@property (strong, nonatomic) IBOutlet UILabel *apartmentLbl;
@property (strong, nonatomic) IBOutlet UILabel *houseVillaLbl;
@property (strong, nonatomic) IBOutlet UILabel *rowHouseLbl;
@property (strong, nonatomic) IBOutlet UILabel *plotLbl;
@property (strong, nonatomic) IBOutlet UILabel *budgetLbl;

//Sales Type

@property (strong, nonatomic) IBOutlet UIButton *salesNewBtn;
@property (strong, nonatomic) IBOutlet UIButton *salesResaleBtn;
@property (strong, nonatomic) IBOutlet UIButton *salesForeclosureBtn;

- (IBAction)salesNewAction:(id)sender;
- (IBAction)salesResaleAction:(id)sender;
- (IBAction)salesForeclosureAction:(id)sender;

//advance Filters

@property (strong, nonatomic) IBOutlet UIButton *showAdvancedFiltersBtn;
- (IBAction)showAdvancedFiltersAction:(id)sender;

//Amenities





@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;
@property (strong, nonatomic) IBOutlet UIButton *resetBtn;
@property (strong, nonatomic) IBOutlet UIButton *searchBtn;
- (IBAction)cancelAction:(id)sender;
- (IBAction)resetAction:(id)sender;
- (IBAction)searchAction:(id)sender;



- (IBAction)apartmentAction:(id)sender;
- (IBAction)houseVillaAction:(id)sender;
- (IBAction)rowHouseAction:(id)sender;
- (IBAction)plotAction:(id)sender;


@end
