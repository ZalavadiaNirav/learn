//
//  BuyFilterViewController.m
//  home
//
//  Created by Nirav Zalavadia on 15/03/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import "BuyFilterViewController.h"
//#define deviceWidth (fabs((double)[[UIScreen mainScreen]bounds].size.width-20.0))
#define deviceheight (fabs((double)[[UIScreen mainScreen]bounds].size.height))

@interface BuyFilterViewController ()
{

}

@end

@implementation BuyFilterViewController

@synthesize rangeSlider;

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollVw.delegate=self;
    
    
  
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    int screenwidth=[[UIScreen mainScreen] bounds].size.width;

    
    self.rangeSlider = [[MARKRangeSlider alloc] initWithFrame:CGRectMake((screenwidth-300)/2,_budgetLbl.frame.origin.y+48, 300, 30)];
    [self.rangeSlider addTarget:self
                         action:@selector(rangeSliderValueDidChange:)
               forControlEvents:UIControlEventValueChanged];
    
    [self.rangeSlider setMinValue:10 maxValue:200];
    [self.rangeSlider setLeftValue:10 rightValue:200];
    
    self.rangeSlider.minimumDistance = 1;
    
    [_scrollVw addSubview:self.rangeSlider];
    
    _scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,_cancelBtn.frame.origin.y+120);

  
}



- (void)rangeSliderValueDidChange:(MARKRangeSlider *)slider {
    NSLog(@"%0.2f - %0.2f", slider.leftValue, slider.rightValue);
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

- (IBAction)salesNewAction:(id)sender {
    NSLog(@"Sales New button clicked");
}

- (IBAction)salesResaleAction:(id)sender {
    NSLog(@"Sales Resale button clicked");
}

- (IBAction)salesForeclosureAction:(id)sender {
    NSLog(@"Sales Foreclosure button clicked");

}

- (IBAction)showAdvancedFiltersAction:(id)sender
{
    
    filterScreen=[[[NSBundle mainBundle] loadNibNamed:@"buyFilterView" owner:self options:nil] objectAtIndex:0];
    NSLog(@"filterscreen %f",_scrollVw.contentSize.height);
    filterScreen.tag=999;
    UIView *tempFilterView=[self.view viewWithTag:999];
    if([[_scrollVw subviews] containsObject:tempFilterView])
    {
        [_showAdvancedFiltersBtn setTitle:@"▽ Show Advanced Filters" forState:UIControlStateNormal];

        _scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,_cancelBtn.frame.origin.y+120);
        for (UIView *vw in [_scrollVw subviews])
        {
            if(vw.tag==999)
            {
                NSLog(@"remove filter screen");
                _scrollVw.contentOffset=CGPointMake(0,0);

                [vw removeFromSuperview];
            }
        }

    }
    else
    {
        NSLog(@"adding filter screen");
        
        
        [filterScreen setFrame:CGRectMake(0,_scrollVw.contentSize.height-80.0, self.view.frame.size.width,(_scrollVw.contentSize.height+filterScreen.frame.size.height))];
        
        _scrollVw.contentOffset=CGPointMake(0,_scrollVw.contentSize.height);
        _scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,(_scrollVw.contentSize.height+filterScreen.frame.size.height-494));
        [_scrollVw addSubview:filterScreen];
        [_showAdvancedFiltersBtn setTitle:@"△ Hide Advanced Filters" forState:UIControlStateNormal];
    }

}

- (IBAction)cancelAction:(id)sender {
    NSLog(@"Cancel button clicked");
}

- (IBAction)resetAction:(id)sender {
    NSLog(@"Reset button clicked");
}

- (IBAction)searchAction:(id)sender {
    NSLog(@"search button clicked");
}

- (IBAction)apartmentAction:(id)sender {
    NSLog(@"Apartment button clicked");
}

- (IBAction)houseVillaAction:(id)sender {
    NSLog(@"House Villa button clicked");
}

- (IBAction)rowHouseAction:(id)sender {
    NSLog(@"RowHouse button clicked");
}

- (IBAction)plotAction:(id)sender {
    NSLog(@"Plot button clicked");
}
@end
