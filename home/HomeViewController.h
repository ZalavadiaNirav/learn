//
//  ViewController.h
//  home
//
//  Created by C N Soft Net on 22/02/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "projectCell.h"
#import "UIButton+ButtonColor.h"
#import "LeftMenuViewController.h"
#import "SlideNavigationController.h"

@interface HomeViewController : UIViewController <SlideNavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,UISearchBarDelegate>
{

    IBOutlet UIView *topView;
    CGFloat height,evenWidth,oddWidth;
    NSMutableArray *servicesArr;
}


//slidebar

@property (nonatomic, strong) IBOutlet UISwitch *limitPanGestureSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *slideOutAnimationSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *shadowSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *panGestureSwitch;
@property (nonatomic, strong) IBOutlet UISegmentedControl *portraitSlideOffsetSegment;
@property (nonatomic, strong) IBOutlet UISegmentedControl *landscapeSlideOffsetSegment;

//background image
@property (strong, nonatomic) IBOutlet UIImageView *tintBackgroundImage;
@property (strong, nonatomic) IBOutlet UIImageView *blueBackgroundImage;


//custom controls

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *buyBtn;
@property (strong, nonatomic) IBOutlet UIButton *rentBtn;
@property (strong, nonatomic) IBOutlet UIButton *projectsBtn;
@property (strong, nonatomic) IBOutlet UIButton *servicesBtn;
@property (strong, nonatomic) IBOutlet UISegmentedControl *residentialSegment;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIButton *realtyClickBtn;
@property (strong, nonatomic) IBOutlet UIButton *nearByPropertiesBtn;
@property (strong, nonatomic) IBOutlet UIButton *recentSearchBtn;
@property (strong, nonatomic) IBOutlet UIButton *savedSearchedBtn;
@property (strong, nonatomic) IBOutlet UIButton *savedPropertiesBtn;
@property (strong, nonatomic) IBOutlet UIButton *postPropertyBtn;

@property (strong, nonatomic) IBOutlet UIView *featuredProjectsView;
@property (strong, nonatomic) IBOutlet UILabel *featureProjectTitleLbl;
@property (strong, nonatomic) IBOutlet UICollectionView *featureProjectsCollectionvw;
@property (strong, nonatomic) IBOutlet UIButton *featureProjectsBackBtn;
@property (strong, nonatomic) IBOutlet UIButton *featureProjectsForwardBtn;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) IBOutlet UIView *featuredBuildersView;
@property (strong, nonatomic) IBOutlet UILabel *featureBuildersTitleLbl;
@property (strong, nonatomic) IBOutlet UICollectionView *featureBuildersCollectionvw;
@property (strong, nonatomic) IBOutlet UIButton *featureBuildersBackBtn;
@property (strong, nonatomic) IBOutlet UIButton *featureBuildersForwardBtn;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl1;
@property (strong, nonatomic) IBOutlet UIButton *serviceBackBtn;
@property (strong, nonatomic) IBOutlet UIButton *serviceForwardBtn;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl2;

@property (strong, nonatomic) IBOutlet UICollectionView *servicesCollectionVw;

//custom Action

- (IBAction)realtyClickAction:(id)sender;
- (IBAction)nearByPropertiesAction:(id)sender;
- (IBAction)buyAction:(id)sender;
- (IBAction)rentAction:(id)sender;
- (IBAction)projectsAction:(id)sender;
- (IBAction)servicesAction:(id)sender;
- (IBAction)recentSearchAction:(id)sender;
- (IBAction)savedSearchAction:(id)sender;
- (IBAction)savedPropertiesAction:(id)sender;
- (IBAction)postPropertyAction:(id)sender;

- (IBAction)featureProjectBackAction:(id)sender;
- (IBAction)featureProjectForwardAction:(id)sender;

- (IBAction)featureBuildersForwardAction:(id)sender;
- (IBAction)featureBuildersBackAction:(id)sender;

- (IBAction)serviceForwardAction:(id)sender;
- (IBAction)serviceBackAction:(id)sender;

//-(void)GradientView: (CGRect)gradientViewframe :(projectCell *)cell;


//slider Action
- (IBAction)bounceMenu:(id)sender;
- (IBAction)slideOutAnimationSwitchChanged:(id)sender;
- (IBAction)limitPanGestureSwitchChanged:(id)sender;
- (IBAction)changeAnimationSelected:(id)sender;
- (IBAction)shadowSwitchSelected:(id)sender;
- (IBAction)enablePanGestureSelected:(id)sender;
- (IBAction)portraitSlideOffsetChanged:(id)sender;
- (IBAction)landscapeSlideOffsetChanged:(id)sender;


@end

