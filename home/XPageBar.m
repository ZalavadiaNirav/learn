//
//  XPageBar.m
//  XPageController
//
//  Created by xlx on 16/4/22.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "XPageBar.h"
#import "XPageViewController.h"
#import <math.h>

#define XPageBarHeight 44
@implementation XPageBar

{
    CGFloat width;
    CGFloat height;
    UIScrollView *scrollView;
    NSMutableArray *untitleBtnArray;
    NSMutableArray *ontitleBtnArray;

    UIView *unMaskBottom;
    UIView *onMaskBottom;

    UIView *unScrollBar;
    UIView *onScrollBar;
    

    CAShapeLayer *mask;
    UIBezierPath *oldPath;
    
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    width = [UIScreen mainScreen].bounds.size.width;
    height = [UIScreen mainScreen].bounds.size.height;
    untitleBtnArray = [@[] mutableCopy];
    ontitleBtnArray = [@[] mutableCopy];
    
    _selectIndex = 0;
    _normarColor = [UIColor lightGrayColor];
    _didSelectColor = [UIColor colorWithRed:234/255.0 green:69/255.0 blue:47/255.0 alpha:0.8];
    self.backgroundColor = [UIColor whiteColor];
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, XPageBarHeight)];
    scrollView.showsVerticalScrollIndicator = false;
    scrollView.showsHorizontalScrollIndicator = false;
    scrollView.userInteractionEnabled=true;
    [self addSubview:scrollView];
    return self;
}

-(void)setXPageTitleArray:(NSMutableArray *)XPageTitleArray{
    _XPageTitleArray = XPageTitleArray;
    CGFloat X = 0;
    for (int i = 0; i<XPageTitleArray.count; i++) {
        NSString *title = XPageTitleArray[i];
         self.untitleBtn = [[UIButton alloc]initWithFrame:CGRectMake(X, 0, [self returnSizeWidthWithTitle:title]+40, XPageBarHeight)];
        self.untitleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.untitleBtn setTitle:title forState:0];
        [self.untitleBtn setTitleColor:_normarColor forState:0];
        [self.untitleBtn setUserInteractionEnabled:TRUE];
        [untitleBtnArray addObject:self.untitleBtn];
        self.untitleBtn.tag = i;
//        [self.untitleBtn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:1<<6];
    
        self.ontitleBtn = [[UIButton alloc]initWithFrame:CGRectMake(X, 0, [self returnSizeWidthWithTitle:title]+40, XPageBarHeight)];
        self.ontitleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.ontitleBtn setTitle:title forState:0];
        [self.ontitleBtn setTitleColor:_didSelectColor forState:0];
        [self.ontitleBtn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:1<<6];
        X+=([self returnSizeWidthWithTitle:title]+40);
        self.ontitleBtn.tag = i;
        [self.ontitleBtn setUserInteractionEnabled:TRUE];
        [ontitleBtnArray addObject:self.ontitleBtn];

    }
    
   
    
    if (X<width) {
        [self setTitleWidth:(width-X)/_XPageTitleArray.count];
    }else{
        scrollView.contentSize = CGSizeMake(X, XPageBarHeight);
    }
    [self setSelectBtnColor:_selectIndex];
    

    CGFloat scrollBarWidth = scrollView.contentSize.width;
    unMaskBottom = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrollBarWidth, XPageBarHeight)];
    onMaskBottom = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrollBarWidth, XPageBarHeight)];
    scrollView.userInteractionEnabled=true;

    [scrollView addSubview:unMaskBottom];
    [scrollView addSubview:onMaskBottom];
    
    for(int i = 0; i<untitleBtnArray.count;i++){
        [unMaskBottom addSubview:untitleBtnArray[i]];
        [onMaskBottom addSubview:ontitleBtnArray[i]];
    }
    self.ontitleBtn.userInteractionEnabled=true;
    self.untitleBtn.userInteractionEnabled=true;
    unMaskBottom.userInteractionEnabled=true;
    onMaskBottom.userInteractionEnabled=true;
    
    [unMaskBottom addSubview:[self unScrollBar]];
    [onMaskBottom addSubview:[self onScrollBar]];
    [self.untitleBtn bringSubviewToFront:self];
    [self.ontitleBtn bringSubviewToFront:self];
    [self setMask];
}

-(void)setMask{
    CGSize firstBtnSize = ((UIButton *)untitleBtnArray.firstObject).frame.size;
    oldPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, firstBtnSize.width, XPageBarHeight)];
    mask = [CAShapeLayer layer];
    mask.frame = onMaskBottom.bounds;
    mask.path = oldPath.CGPath;
    onMaskBottom.layer.mask = mask;
}

-(void)setOffX:(CGFloat)offX{
    _offX = offX;
    if (offX == 0) {
        return;
    }
    NSInteger currentIndex = _selectIndex;
    currentIndex = offX/width;
    CGFloat x1 = ((UIButton *)ontitleBtnArray[currentIndex]).frame.origin.x;
    CGFloat x2 = 0;
    CGFloat x = 0;
    CGFloat off = 0;
    CGFloat maskWidth1 = ((UIButton *)ontitleBtnArray[currentIndex]).frame.size.width;
    CGFloat maskWidth2 = 0;
    CGFloat maskWidth = 0;
    CGFloat offWidth = 0;
    if (offX>currentIndex*width) {
        x2 = ((UIButton *)ontitleBtnArray[currentIndex+1]).frame.origin.x;
        maskWidth2 = ((UIButton *)ontitleBtnArray[currentIndex+1]).frame.size.width;
    }else{
        x2 = ((UIButton *)ontitleBtnArray[currentIndex-1]).frame.origin.x;
        maskWidth2 = ((UIButton *)ontitleBtnArray[currentIndex-1]).frame.size.width;
    }
    off = fabs(x1 - x2);
    
    offWidth = maskWidth1-maskWidth2;
    CGFloat widP = fabs((offX/width-currentIndex)) * offWidth;
    maskWidth = maskWidth1 - widP;

    x = x1 - (width*currentIndex-offX) / width *off;
    
    CGRect maskRect = mask.frame;
    maskRect.origin.x = x;
    maskRect.size.width = maskWidth;
    oldPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, maskWidth, XPageBarHeight)];
    mask.frame = maskRect;
    mask.path = oldPath.CGPath;
}



-(UIView *)unScrollBar{
    if (!unScrollBar) {
        CGFloat scrollBarWidth = scrollView.contentSize.width;
        unScrollBar = [[UIView alloc]initWithFrame:CGRectMake(0, XPageBarHeight-2, scrollBarWidth, 2)];
        unScrollBar.backgroundColor = _normarColor;
    }
    return unScrollBar;
}

-(UIView *)onScrollBar{
    if (!onScrollBar) {
        CGFloat scrollBarWidth = scrollView.contentSize.width;
        onScrollBar = [[UIView alloc]initWithFrame:CGRectMake(0, XPageBarHeight-2, scrollBarWidth, 2)];
        onScrollBar.backgroundColor = _didSelectColor;
    }
    return onScrollBar;
}

-(CGFloat)returnSizeWidthWithTitle:(NSString *)title{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:15]};
    return [title boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
}

-(void)setTitleWidth:(CGFloat)moreWidth{
    CGFloat X = 0;
    for (UIButton *btn in untitleBtnArray) {
        CGRect rect = btn.frame;
        rect.size.width+=moreWidth;
        rect.origin.x = X;
        btn.frame = rect;
        X+=rect.size.width;
    }
    scrollView.contentSize = CGSizeMake(X, XPageBarHeight);
}

-(void)setSelectBtnColor:(NSInteger)index{
    _selectIndex = index;
    for (UIButton *btn in ontitleBtnArray) {
        [btn setTitleColor:_didSelectColor forState:0];
    }
    [self scrollPageBar];
}
-(void)updateSelectBtn{
    [self setSelectBtnColor:_selectIndex];
    onScrollBar.backgroundColor = _didSelectColor;
}

-(void)clickTitleBtn:(UIButton *)btn{
    _selectIndex = btn.tag;
    [self setSelectBtnColor:btn.tag];
    [self scrollPageBar];
    _target.selectIndex = btn.tag;
}

-(void)scrollPageBar{
    UIButton *btn = untitleBtnArray[_selectIndex];
    CGFloat btnCenter = btn.center.x;
    CGFloat scrollToX = btnCenter - width/2;
    if (scrollToX>0&&scrollToX<scrollView.contentSize.width-width) {
        [scrollView setContentOffset:CGPointMake(scrollToX, 0) animated:true];
    }
    if (scrollToX>scrollView.contentSize.width-width) {
        [scrollView setContentOffset:CGPointMake(scrollView.contentSize.width-width, 0) animated:true];
    }
    if (scrollToX<0) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:true];
    }

}
@end









