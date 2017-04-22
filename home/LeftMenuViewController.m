//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "headerCell.h"

@implementation LeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
    _tableView.delegate=self;
    _tableView.dataSource=self;
	
	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.jpg"]];
	_tableView.backgroundView = imageView;
}

#pragma mark - UITableView Delegate & Datasrouce -

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
        return 2;
    if(section==1)
        return 2;
    else
        return 4;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section==0)
    {
        UIView *footerView=[[UIView alloc] init];
        _tableView.frame=CGRectMake(0, 0, _tableView.frame.size.width,2);
        _tableView.separatorColor=[UIColor blackColor];
        return footerView;
    }
    if(section==1)
    {
        UIView *footerView=[[UIView alloc] init];
        self.tableView.frame=CGRectMake(0, 0, _tableView.frame.size.width,2);
        self.tableView.separatorColor=[UIColor blackColor];
        return footerView;
    }
    return nil;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    if(section==0)
        sectionName=@"Request";
    if(section==1)
        sectionName=@"Properties";
    if(section==0||section==1)
    {
        headerCell* header = [tableView dequeueReusableCellWithIdentifier:@"headerCell"];
        header.backgroundColor=[UIColor lightGrayColor];
        header.headerTitleLbl.text=[NSString stringWithFormat:@"%@",sectionName];
        header.headerImgvw.image=[UIImage imageNamed:@"even"];
        return header;
    }

    return nil;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==0||section==1)
        return 30.0;
    else
        return 0.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier=@"CellIdentifier";
    UITableViewCell *cell;
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        if (indexPath.section==0)
        {
            if(indexPath.row==0)
            {
                cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.text = @"Post Requests";
            }
            if(indexPath.row==1)
            {
                cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.text = @"My Requests";
            }
        }
        if (indexPath.section==1)
        {
            if(indexPath.row==0)
            {
                cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.text = @"Post Properties";
            }
            if(indexPath.row==1)
            {
                cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.text = @"My Properties";
            }
        }
        NSString *sectionName;
        if (indexPath.section==2)
        {
            if(indexPath.row==0)
                sectionName = @"My Schedule";
            
            if(indexPath.row==1)
                sectionName = @"Footprint";
            
            if(indexPath.row==2)
                sectionName = @"Settings";
            
            if(indexPath.row==3)
                sectionName = @"Sign Out";
            
            headerCell* header = [tableView dequeueReusableCellWithIdentifier:@"headerCell"];
            header.headerTitleLbl.text=[NSString stringWithFormat:@"%@",sectionName];
            header.headerImgvw.image=[UIImage imageNamed:@"even"];
            header.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            return header;
        }
    }
	
		
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//	UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
//															 bundle: nil];
//	
//	UIViewController *vc ;
//	
//	switch (indexPath.row)
//	{
//		case 0:
//			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
//			break;
//			
//		case 1:
//			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"ProfileViewController"];
//			break;
//			
//		case 2:
//			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"FriendsViewController"];
//			break;
//			
//		case 3:
//			[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
//			[[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
//			return;
//			break;
//	}
	
//	[[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
//															 withSlideOutAnimation:self.slideOutAnimationEnabled
//																	 andCompletion:nil];
}

@end
