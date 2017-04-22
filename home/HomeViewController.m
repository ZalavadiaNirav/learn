//
//  ViewController.m
//  home
//
//  Created by C N Soft Net on 22/02/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import "HomeViewController.h"
#import "UIButton+ButtonColor.h"
#import "projectCell.h"
#import "builderCell.h"
#import "servicesCell.h"

#define   DEGREES_TO_RADIANS(degrees)  ((3.145 * degrees)/ 180)
#define deviceWidth (fabs((double)[[UIScreen mainScreen]bounds].size.width-20.0))
#define deviceheight (fabs((double)[[UIScreen mainScreen]bounds].size.height))

@interface HomeViewController ()
{
    NSArray *gradientColors;
    int featureProjectsTotalPages,featureBuildersTotalPages,serviceTotalPages;
}
@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 503);
    self.portraitSlideOffsetSegment.selectedSegmentIndex = [self indexFromPixels:[SlideNavigationController sharedInstance].portraitSlideOffset];
    self.landscapeSlideOffsetSegment.selectedSegmentIndex = [self indexFromPixels:[SlideNavigationController sharedInstance].landscapeSlideOffset];
    self.panGestureSwitch.on = [SlideNavigationController sharedInstance].enableSwipeGesture;
    self.shadowSwitch.on = [SlideNavigationController sharedInstance].enableShadow;
    self.limitPanGestureSwitch.on = ([SlideNavigationController sharedInstance].panGestureSideOffset == 0) ? NO : YES;
    self.slideOutAnimationSwitch.on = ((LeftMenuViewController *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled;
    _searchBar.delegate=self;
    
    servicesArr=[[NSMutableArray alloc] init];
    [servicesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"even",@"image",@"Agents",@"sName", nil]];
    [servicesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"odd",@"image",@"Interior Designer",@"sName", nil]];
    [servicesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"even",@"image",@"Modular Kitchen Providers",@"sName", nil]];
    [servicesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"odd",@"image",@"Furniture Dealrs",@"sName", nil]];
    [servicesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"even",@"image",@"Appliances Dealer",@"sName", nil]];
    
    [servicesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"even",@"image",@"Agents",@"sName", nil]];
    [servicesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"odd",@"image",@"Interior Designer",@"sName", nil]];
    [servicesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"even",@"image",@"Modular Kitchen Providers",@"sName", nil]];
    [servicesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"odd",@"image",@"service",@"sName", nil]];
    [servicesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"even",@"image",@"View All Services",@"sName", nil]];
    
    
    
    UIButton *locationBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [locationBtn addTarget:self action:@selector(locationAction:) forControlEvents:UIControlEventTouchUpInside];
    locationBtn.frame=CGRectMake(0, 0, 34,34);
    [locationBtn setBackgroundImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    
    UILabel *cityLbl=[[UILabel alloc] init];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont fontWithName:@"HelveticaNeue" size:18.0],
                                NSFontAttributeName,[UIColor colorWithRed:(159.0/255.0) green:(173.0/255.0) blue:(188.0/255.0) alpha:1.0], NSForegroundColorAttributeName, nil];
    cityLbl.attributedText=[[NSAttributedString alloc] initWithString:@"Ahmedabad" attributes:attributes];
    cityLbl.textAlignment=NSTextAlignmentRight;
    cityLbl.frame=CGRectMake(0, 0,100,30);
 
        self.title=@"HOME";
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:(16.0/255.0) green:(56.0/255.0) blue:(102.0/255.0) alpha:1.0]];
    

    UIBarButtonItem *locationBarButton=[[UIBarButtonItem alloc] initWithCustomView:locationBtn];
    UIBarButtonItem *cityBarLbl=[[UIBarButtonItem alloc] initWithCustomView:cityLbl];
    NSArray *barbutton=[[NSArray alloc] initWithObjects:locationBarButton,cityBarLbl, nil];
    self.navigationItem.rightBarButtonItems=barbutton;
    
    [[_residentialSegment layer] setBorderWidth:1.0f];
    [[_residentialSegment layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];
    [[_residentialSegment layer] setCornerRadius:5.0];

    [[_searchBar layer] setCornerRadius:10.0];
    
    
    [[_buyBtn layer] setBorderWidth:1.0f];
    [[_buyBtn layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];
    [[_buyBtn layer] setCornerRadius:5.0];

    
    [[_rentBtn layer] setBorderWidth:1.0f];
    [[_rentBtn layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];
    [[_rentBtn layer] setCornerRadius:5.0];
    
    [[_servicesBtn layer] setBorderWidth:1.0f];
    [[_servicesBtn layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];
    [[_servicesBtn layer] setCornerRadius:5.0];
    
    [[_projectsBtn layer] setBorderWidth:1.0f];
    [[_projectsBtn layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];
    [[_projectsBtn layer] setCornerRadius:5.0];
    
    [[_realtyClickBtn layer] setCornerRadius:5.0];
    [[_realtyClickBtn layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];

    [[_realtyClickBtn layer] setBorderWidth:1.0f];
    
    [[_postPropertyBtn layer] setCornerRadius:5.0];
    [[_postPropertyBtn layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];

    [[_postPropertyBtn layer] setBorderWidth:1.0f];
    
    [[_savedSearchedBtn layer] setCornerRadius:5.0];
    [[_savedSearchedBtn layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];

    [[_savedSearchedBtn layer] setBorderWidth:1.0f];
    
    [[_nearByPropertiesBtn layer] setCornerRadius:5.0];
    [[_nearByPropertiesBtn layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];

    [[_nearByPropertiesBtn layer] setBorderWidth:1.0f];

    [[_savedPropertiesBtn layer] setCornerRadius:5.0];
    [[_savedPropertiesBtn layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];

    [[_savedPropertiesBtn layer] setBorderWidth:1.0f];
    
    [[_recentSearchBtn layer] setCornerRadius:5.0];
    [[_recentSearchBtn layer] setBorderColor:[UIColor colorWithRed:(106.0/255.0) green:(136.0/255.0) blue:(158.0/255.0) alpha:1].CGColor];

    [[_recentSearchBtn layer] setBorderWidth:1.0f];

    
    _scrollView.delegate=self;

    _featureProjectsCollectionvw.delegate=self;
    _featureProjectsCollectionvw.dataSource=self;
    
    //Feature Projects Collectionview
    
    evenWidth=round(fabs((deviceWidth*0.6)-10.0));
    oddWidth=round(fabs((deviceWidth*0.4)-10.0));
    height=round(fabs((deviceheight*0.35869)));
    _featureProjectsCollectionvw.frame=CGRectMake(_featuredProjectsView.frame.origin.x+14,_featuredProjectsView.frame.origin.y+100.0, evenWidth+oddWidth+20.0,height);
    
    
    _featureProjectsCollectionvw.translatesAutoresizingMaskIntoConstraints=true;

    [_featureProjectsCollectionvw layoutIfNeeded];
//    [UICollectionViewLayout invalid];
    
    [_featureProjectsCollectionvw reloadData];
    
    
    _featureBuildersCollectionvw.delegate=self;
    _featureBuildersCollectionvw.dataSource=self;
    
    //Feature Builders Collectionview
    
    evenWidth=round(fabs((deviceWidth*0.6)-10.0));
    oddWidth=round(fabs((deviceWidth*0.4)-10.0));
    height=round(fabs((deviceheight*0.35869)));
    _featureBuildersCollectionvw.frame=CGRectMake(_featuredBuildersView.frame.origin.x+14,_featuredBuildersView.frame.origin.y+40.0, evenWidth+oddWidth+20.0,height);
    
    _featureBuildersCollectionvw.translatesAutoresizingMaskIntoConstraints=true;
    
    [_featureBuildersCollectionvw layoutIfNeeded];
    
    [_featureBuildersCollectionvw reloadData];
    
    _servicesCollectionVw.delegate=self;
    _servicesCollectionVw.dataSource=self;
    
    [_servicesCollectionVw reloadData];

    [self validateEmail];
    
}
//NSString *emailRegex = @"[A-Z0-9a-z]([A-Z0-9a-z._-]{0,64})+[A-Z0-9a-z]+@[A-Z0-9a-z]+([A-Za-z0-9.-]{0,64})+([A-Z0-9a-z])+\\.[A-Za-z]{2,4}";    NSString *firstNameRegex = @"[0-9A-Za-z\"'-]{2,32}$";
//NSString *firstNameRegex = @"[ 0-9A-Za-z]{2,32}$";
//NSString *lastNameRegex = @"[0-9A-Za-z\"'-]{2,32}$";
//NSString *mobileNumberRegEx = @"^[0-9]{10}$";
//NSString *zipcodeRegEx = @"^[0-9]{5}$";
//NSString *SSNRegEx = @"^\\d{3}-?\\d{2}-?\\d{4}$";
//NSString *addressRegEx = @"^[ A-Za-z0-9]{2,32}$";
//NSString *cityRegEx = @"^[ A-Za-z0-9]{2,25}$";
//NSString *PINRegEx = @"^[0-9]{4}$";
//NSString *driversLiscRegEx = @"^[0-9a-zA-Z]{5,20}$";

-(BOOL)validateEmail
{
     NSString *emailRegex = @"[A-Z0-9a-z]([A-Z0-9a-z._-]{0,64})+[A-Z0-9a-z]+@[A-Z0-9a-z]+([A-Za-z0-9.-]{0,64})+([A-Z0-9a-z])+\\.[A-Za-z]{2,4}";
    NSString *email=@"hi@gmail.com";
    //Email address field should give an error when the email address begins with ".","-","_" .
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    NSLog(@"result=%d", ([emailPredicate evaluateWithObject:email] && email.length <= 12 && ([email rangeOfString:@".."].location == NSNotFound)));
    return NO;
}

-(void)viewDidLayoutSubviews
{
    if (deviceheight>=667) //i 6,6s,7,7Plus
        _scrollView.contentSize=CGSizeMake(self.view.frame.size.width,1800);
    else if(deviceheight>=568)//i 5,5C,5S
        _scrollView.contentSize=CGSizeMake(self.view.frame.size.width,1380);
    else if(deviceheight>=480)
        _scrollView.contentSize=CGSizeMake(self.view.frame.size.width, 1310);

}
#pragma mark- Collectionview 

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //total item/number of item per row
    if([collectionView isEqual:_featureProjectsCollectionvw])
    {
        featureProjectsTotalPages=(roundf(5.0/2.0));
        _pageControl.numberOfPages=featureProjectsTotalPages;
        return 5.0;
    }
    if([collectionView isEqual:_featureBuildersCollectionvw])
    {
        featureBuildersTotalPages=(roundf(7.0/2.0));
        _pageControl1.numberOfPages=featureBuildersTotalPages;

        return 7.0;
    }
    if([collectionView isEqual:_servicesCollectionVw])
    {
        serviceTotalPages=(roundf([servicesArr count]/5.0));
        _pageControl2.numberOfPages=serviceTotalPages;

        return [servicesArr count];
    }
    return 0;
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if([collectionView isEqual:_featureProjectsCollectionvw])
        return 1;
    if([collectionView isEqual:_featureBuildersCollectionvw])
        return 1;
    if([collectionView isEqual:_servicesCollectionVw])
        return 1;
    return 0;
}

//UICollectionViewDelegateFlowLayout's mehtod
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

// width 320-20=300  180,110 60% 36.66% height 480-20=460  165     35.869%

    NSLog(@"evenwidth %f height %f oddwidth %f",evenWidth,height,oddWidth);
    NSLog(@"total space %f used %f",deviceWidth,(evenWidth+oddWidth));
    
    
    
    if([collectionView isEqual:_featureBuildersCollectionvw])
    {

        if((indexPath.row%2)==0)
            return CGSizeMake(oddWidth, height);
        else
            return CGSizeMake(evenWidth, height);

    }
    else if([collectionView isEqual:_featureProjectsCollectionvw])
    {
        
      
        if((indexPath.row%2)==0)
            return CGSizeMake(evenWidth, height);
        else
            return CGSizeMake(oddWidth, height);
    }
    else if ([collectionView isEqual:_servicesCollectionVw])
    {
        NSLog(@"width %f",(([[UIScreen mainScreen]bounds].size.width-60.0)/5.0));
        return CGSizeMake((([[UIScreen mainScreen]bounds].size.width-60.0)/5.0), 100);
    }
    
    return CGSizeMake(2, 2);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if([collectionView isEqual:_featureProjectsCollectionvw])
    {
        projectCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"projectCell" forIndexPath:indexPath];
        NSLog(@"row1 %ld",(long)indexPath.item);

        cell.tag=indexPath.item;
        
        NSDictionary *cellDict=[NSDictionary dictionaryWithObject:cell forKey:@"cellObj"];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backgroundlayer:) name:@"projectCellObserver" object:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"projectCellObserver" object:nil userInfo:cellDict];
        if([cell isMemberOfClass:[projectCell class]])
        {
            if(indexPath.row%2==0)
                cell.propertyImgvw.image=[UIImage imageNamed:@"odd.png"];
            else
                cell.propertyImgvw.image=[UIImage imageNamed:@"even.png"];
            
            int pages = floor(_featureProjectsCollectionvw.contentSize.width / _featureProjectsCollectionvw.frame.size.width) + 1;
             [[NSNotificationCenter defaultCenter] postNotificationName:@"proejctCell" object:cell];
            NSLog(@"currently projectcell %@ number of pages %d",_featureProjectsCollectionvw.visibleCells,pages);
            [_pageControl setNumberOfPages:pages];
            
        }

        return cell;
    }
     if([collectionView isEqual:_featureBuildersCollectionvw])
    {
        builderCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"builderCell" forIndexPath:indexPath];
        cell.tag=indexPath.item;

        NSDictionary *cellDict=[NSDictionary dictionaryWithObject:cell forKey:@"cellObj"];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backgroundlayer:) name:@"builderCellObserver" object:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"builderCellObserver" object:nil userInfo:cellDict];
        
        if([cell isMemberOfClass:[builderCell class]])
        {
            
            if(indexPath.row%2==0)
                cell.builderImgvw.image=[UIImage imageNamed:@"even.png"];
            else
                cell.builderImgvw.image=[UIImage imageNamed:@"odd.png"];
            

            int pages = floor(_featureBuildersCollectionvw.contentSize.width / _featureBuildersCollectionvw.frame.size.width) + 1;

            [_pageControl1 setNumberOfPages:pages];

        }
//        [self backgroundlayer:cell];

        return cell;
    }
    if([collectionView isEqual:_servicesCollectionVw])
    {
        servicesCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"servicesCell" forIndexPath:indexPath];
        cell.serviceNameLbl.text=[NSString stringWithFormat:@"%@",[[servicesArr objectAtIndex:indexPath.item] objectForKey:@"sName"]];
        cell.serviceIcon.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",[[servicesArr objectAtIndex:indexPath.item] objectForKey:@"image"]]];
        return cell;
    }
    

    return nil;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item==9)
    {
        NSLog(@"Open new page");
    }
}

-(void)backgroundlayer:(NSNotification *)notification
{

    UIColor *topColor=[UIColor colorWithRed:(255.0/256.0) green:(255.0/256.0) blue:(255.0/256.0) alpha:.205];
    UIColor *bottomColor=[UIColor colorWithRed:(0.0/256.0) green:(0.0/256.0) blue:(0.0/256.0) alpha:.25];
    gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor,(id)bottomColor.CGColor, nil];
    
    
    if([notification.name isEqualToString:@"projectCellObserver"])
    {
        projectCell *cell=(projectCell *)[notification.userInfo objectForKey:@"cellObj"];
        
        if([[cell class] isEqual:[projectCell class]])
        {
            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
            gradientLayer.colors = gradientColors;
            gradientLayer.locations=[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.25],[NSNumber numberWithFloat:.50],[NSNumber numberWithFloat:.75],nil];
            gradientLayer.frame=cell.gradientView.frame;
            cell.gradientView.layer.sublayers = nil;
            
            [cell.gradientView.layer addSublayer:gradientLayer];
//            [cell.gradientView.layer setBackgroundColor:topColor.CGColor];
//            [cell.gradientView.layer setBackgroundColor:bottomColor.CGColor];
        }
    }
    if([notification.name isEqualToString:@"builderCellObserver"])
    {
        builderCell *cell=(builderCell *)[notification.userInfo objectForKey:@"cellObj"];
        
        if([[cell class] isEqual:[builderCell class]])
        {
            CAGradientLayer *gradientLayer1 = [CAGradientLayer layer];
            gradientLayer1.colors = gradientColors;

            gradientLayer1.locations=[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.25],[NSNumber numberWithFloat:.50],[NSNumber numberWithFloat:.75],nil];

            gradientLayer1.frame=cell.builderImgvw.frame;
            
            cell.gradientView.layer.sublayers = nil;
             
            [cell.gradientView.layer addSublayer:gradientLayer1];
//            [cell.gradientView.layer setBackgroundColor:bottomColor.CGColor];
        }
    }
    
}


#pragma mark - UIScrollVewDelegate for UIPageControl

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isMemberOfClass:[_featureProjectsCollectionvw class]])
    {
        CGFloat pageWidth = (_featureProjectsCollectionvw.frame.size.width);
        float currentPage = (_featureProjectsCollectionvw.contentOffset.x /pageWidth);
        
        if (0.0f != fmodf(currentPage, 1.0f)) {
            _pageControl.currentPage = currentPage + 1;
        } else {
            _pageControl.currentPage = currentPage;
        }
//        NSLog(@"projects scrollview end scroll x= %f",_featureProjectsCollectionvw.frame.origin.x);
    }
    if ([scrollView isMemberOfClass:[_featureBuildersCollectionvw class]])
    {
        CGFloat pageWidth1 = (_featureBuildersCollectionvw.frame.size.width);
        float currentPage = _featureBuildersCollectionvw.contentOffset.x / pageWidth1;
        
        if (0.0f != fmodf(currentPage, 1.0f)) {
            _pageControl1.currentPage = currentPage + 1;
        } else {
            _pageControl1.currentPage = currentPage;
        }
        NSLog(@"builders scrollview end");
    }
}

#pragma mark - SearchViewController


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [_searchBar resignFirstResponder];

    [self performSegueWithIdentifier:@"pageVCID" sender:self];
}

#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender
{
}

#pragma mark - Next & Prev Page Button


- (IBAction)featureProjectBackAction:(id)sender {
    _pageControl.currentPage--;
    CGFloat prevPageX = (_featureProjectsCollectionvw.frame.size.width) * MAX(_pageControl.currentPage, 0);
    [_featureProjectsCollectionvw setContentOffset:CGPointMake(prevPageX, 0) animated:YES];
    //    NSLog(@"NewPage: %d", _pageControl.currentPage);
}

- (IBAction)featureProjectForwardAction:(id)sender {
    _pageControl.currentPage++;
    CGFloat prevPageX1 = (_featureProjectsCollectionvw.frame.size.width) * MIN(_pageControl.currentPage, featureProjectsTotalPages);
    [_featureProjectsCollectionvw setContentOffset:CGPointMake(prevPageX1, 0) animated:YES];
    //    NSLog(@"NewPage: %d", _pageControl.currentPage);
    
}

- (IBAction)featureBuildersForwardAction:(id)sender {
    _pageControl1.currentPage++;
    CGFloat prevPageX2 = (_featureBuildersCollectionvw.frame.size.width) * MIN(_pageControl1.currentPage, featureBuildersTotalPages);
    [_featureBuildersCollectionvw setContentOffset:CGPointMake(prevPageX2, 0) animated:YES];
    //    NSLog(@"NewPage: %d", _pageControl1.currentPage);

}

- (IBAction)featureBuildersBackAction:(id)sender {
    _pageControl1.currentPage--;
    CGFloat prevPageX3 = (_featureBuildersCollectionvw.frame.size.width) * MAX(_pageControl1.currentPage, 0);
    [_featureBuildersCollectionvw setContentOffset:CGPointMake(prevPageX3, 0) animated:YES];
    //    NSLog(@"NewPage: %d", _pageControl1.currentPage);
}

- (IBAction)serviceForwardAction:(id)sender {
    _pageControl2.currentPage++;
    CGFloat prevPageX4 = (_servicesCollectionVw.frame.size.width+10.0) * MIN(_pageControl2.currentPage,serviceTotalPages);
    [_servicesCollectionVw setContentOffset:CGPointMake(prevPageX4, 0) animated:YES];
}

- (IBAction)serviceBackAction:(id)sender
{
    _pageControl2.currentPage--;
    CGFloat prevPageX5 = (_servicesCollectionVw.frame.size.width+10.0) * MAX(_pageControl2.currentPage, 0);
    [_servicesCollectionVw setContentOffset:CGPointMake(prevPageX5, 0) animated:YES];
    //    NSLog(@"NewPage: %d", _pageControl1.currentPage);
}



#pragma mark - Other Actions


-(IBAction)locationAction:(id)sender
{
    
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}

#pragma mark - IBActions -

- (IBAction)realtyClickAction:(id)sender {
}

- (IBAction)nearByPropertiesAction:(id)sender {
}

- (IBAction)buyAction:(id)sender {
    NSLog(@"BUY");
    
    [_buyBtn setBackgroundColor:[UIColor colorWithRed:(16.0/256.0) green:(56.0/256.0) blue:(102.0/256.0) alpha:1.0] forState:UIControlStateHighlighted];

}

- (IBAction)rentAction:(id)sender {
    NSLog(@"RENT");
}

- (IBAction)projectsAction:(id)sender {
}

- (IBAction)servicesAction:(id)sender {
}

- (IBAction)recentSearchAction:(id)sender {
}

- (IBAction)savedSearchAction:(id)sender {
}

- (IBAction)savedPropertiesAction:(id)sender {
}

- (IBAction)bounceMenu:(id)sender
{
    static Menu menu = MenuLeft;
    
    [[SlideNavigationController sharedInstance] bounceMenu:menu withCompletion:nil];
    
    menu = (menu == MenuLeft) ? MenuRight : MenuLeft;
}

- (IBAction)slideOutAnimationSwitchChanged:(UISwitch *)sender
{
    ((LeftMenuViewController *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled = sender.isOn;
}

- (IBAction)limitPanGestureSwitchChanged:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].panGestureSideOffset = (sender.isOn) ? 50 : 0;
}

- (IBAction)changeAnimationSelected:(id)sender
{
    [[SlideNavigationController sharedInstance] openMenu:MenuRight withCompletion:nil];
}

- (IBAction)shadowSwitchSelected:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].enableShadow = sender.isOn;
}

- (IBAction)enablePanGestureSelected:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].enableSwipeGesture = sender.isOn;
}

- (IBAction)portraitSlideOffsetChanged:(UISegmentedControl *)sender
{
    [SlideNavigationController sharedInstance].portraitSlideOffset = [self pixelsFromIndex:sender.selectedSegmentIndex];
}

- (IBAction)landscapeSlideOffsetChanged:(UISegmentedControl *)sender
{
    [SlideNavigationController sharedInstance].landscapeSlideOffset = [self pixelsFromIndex:sender.selectedSegmentIndex];
}

#pragma mark - Helpers -

- (NSInteger)indexFromPixels:(NSInteger)pixels
{
    if (pixels == 60)
        return 0;
    else if (pixels == 120)
        return 1;
    else
        return 2;
}

- (NSInteger)pixelsFromIndex:(NSInteger)index
{
    switch (index)
    {
        case 0:
            return 60;
            
        case 1:
            return 120;
            
        case 2:
            return 200;
            
        default:
            return 0;
    }
}


- (IBAction)postPropertyAction:(id)sender {
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:@"projectCellObserver"];
    [[NSNotificationCenter defaultCenter] removeObserver:@"builderCellObserver"];

}

@end
