//
//  SearchViewController.m
//  home
//
//  Created by Nirav Zalavadia on 15/03/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XPageViewController *pageController=[[XPageViewController alloc] init];
    pageController.title=@"Buy";
    pageController.dataSource=self;
    [self addChildViewController:pageController];
    [self.view addSubview:pageController.view];
}

-(NSInteger)numberOfControllers{
    return 5;
}
-(UIViewController *)XPageCurrentViewController:(NSInteger)index{
    VieViewController *vc;
    if (index==0)
        vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BuyID"];
    else if(index==1)
        vc=[self.storyboard instantiateViewControllerWithIdentifier:@"RentID"];
    else if(index==2)
        vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ProjectsID"];
    else if(index==3)
        vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ProfileID"];
    else if(index==4)
        vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ServicesID"];
    return vc;
}
-(NSString *)XPageTitleOfEachController:(NSInteger)index{
    if (index == 0) {
        return @"BUY";
    }
    else if (index == 1) {
        return @"RENT";
    }
    else if (index == 2) {
        return @"PROJECTS";
    }
    else if (index == 3) {
        return @"PROFILE";
    }
    else if (index == 4) {
        return @"SERVICE";
    }
    return @"VC";
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
