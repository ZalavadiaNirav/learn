//
//  XPageBar.h
//  XPageController
//
//  Created by xlx on 16/4/22.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol scrollbtndelegate  <NSObject>

-(void)btnclicked:(id)sender;

@end

@class XPageViewController;


@interface XPageBar : UIView

@property (nonatomic, strong) NSMutableArray *XPageTitleArray;

@property (nonatomic, strong) UIColor *didSelectColor;
@property (nonatomic, strong) UIColor *normarColor;
@property (nonatomic, ) NSInteger selectIndex;

@property (nonatomic) CGFloat offX;
@property () id <scrollbtndelegate>delegate;

@property (nonatomic, weak) XPageViewController *target;
@property (nonatomic,retain)UIButton *untitleBtn,*ontitleBtn;
-(void)setSelectBtnColor:(NSInteger)index;
-(void)updateSelectBtn;

@end
