//
//  buyFilterView.m
//  home
//
//  Created by Nirav Zalavadia on 24/03/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import "buyFilterView.h"
#import "amenitiesCell.h"
#import "localityCell.h"
#import <math.h>

@implementation buyFilterView

@synthesize amenitiesArr,localityArr;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   
    //Amenities Array
    self.amenitiesArr=[[NSMutableArray alloc] init];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Car Parkings",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Club House",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Swimming Pool",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Gymanasium",@"amenitiesName",@"even",@"amenitiesImg",nil]];

    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Lift",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Air Condition",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Maintenance Staff",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Water Storage",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Intercom Facility",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Entrance Facing",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Security",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Internet/Wi-Fi Connectivity",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Banquet Hall",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Gas Pipeline",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Reserved Parking",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Visitor Parking",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Power Back Up",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Park",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    [self.amenitiesArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Play Area",@"amenitiesName",@"even",@"amenitiesImg",nil]];
    
    _amenitiesCollectionvw.delegate=self;
    _amenitiesCollectionvw.dataSource=self;
    
    float amenitiesRowSpacing=(ceil([amenitiesArr count]/4.0)*10.0);
    float amenitiesCollectionVwHeight=ceil(([amenitiesArr count]*125.0)/4.0);
    _amenitiesCollectionvw.frame=CGRectMake(0,_amenitiesLbl.frame.origin.y+40,self.frame.size.width,(amenitiesCollectionVwHeight+amenitiesRowSpacing));
    
    [_amenitiesCollectionvw registerNib:[UINib nibWithNibName:@"amenitiesCell" bundle:nil] forCellWithReuseIdentifier:@"amenitiesCell"];
    [_amenitiesCollectionvw layoutSubviews];
    [_amenitiesCollectionvw reloadData];
    
    
    //Locality Array
    self.localityArr=[[NSMutableArray alloc] init];
    [self.localityArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Atm",@"localityName",@"even",@"localityImg",nil]];
    [self.localityArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Petrol",@"localityName",@"even",@"localityImg",nil]];
    [self.localityArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Shopping Mall",@"localityName",@"even",@"localityImg",nil]];
    [self.localityArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Gynasium",@"localityName",@"even",@"localityImg",nil]];
    
    float localityRowSpacing=(ceil([self.localityArr count]/4.0)*10.0);
    float localityCollectionVwHeight=ceil(([self.localityArr count]*125.0)/4.0);

    
   
    _localityCollectionvw.delegate=self;
    _localityCollectionvw.dataSource=self;
    
    _localityLbl.frame=CGRectMake(0,_amenitiesCollectionvw.frame.origin.y+amenitiesCollectionVwHeight+amenitiesRowSpacing,self.frame.size.width,40.0);
    
    _localityCollectionvw.frame=CGRectMake(0,_localityLbl.frame.origin.y+40,self.frame.size.width,(localityCollectionVwHeight+localityRowSpacing));
     [_localityCollectionvw registerNib:[UINib nibWithNibName:@"localityCell" bundle:nil] forCellWithReuseIdentifier:@"localityCell"];
    [_localityCollectionvw reloadData];
    
    _buyFilterScrollVw.delegate=self;
    _buyFilterScrollVw.contentSize=CGSizeMake(self.frame.size.width,_localityCollectionvw.frame.size.height);

    
}

//collectionview

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    if(collectionView==_localityCollectionvw)
        return [localityArr count];
    else if(collectionView==_amenitiesCollectionvw)
        return [amenitiesArr count];

    return 01;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(65, 115);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    amenitiesCell *cell;
    localityCell *cell1;
    if(collectionView==_amenitiesCollectionvw)
    {
        cell = (amenitiesCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"amenitiesCell" forIndexPath:indexPath];
        cell.AmenitiesNameLbl.text=[[amenitiesArr objectAtIndex:indexPath.item] objectForKey:@"amenitiesName"];
        
        cell.amenitiesBtn.tag=indexPath.item;
        [cell.amenitiesBtn addTarget:self action:@selector(amenitiesAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.amenitiesBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[[amenitiesArr objectAtIndex:indexPath.item] objectForKey:@"amenitiesImg"]]] forState:UIControlStateNormal];
        return cell;
    }
    if(collectionView==_localityCollectionvw)
    {
        cell1 =[collectionView dequeueReusableCellWithReuseIdentifier:@"localityCell" forIndexPath:indexPath];
        
        cell1.localityLbl.text=[NSString stringWithFormat:@"%@",[[localityArr objectAtIndex:indexPath.item] objectForKey:@"localityName"]];
        cell1.localityBtn.tag=indexPath.row;
        [cell1.localityBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[[localityArr objectAtIndex:indexPath.item] objectForKey:@"localityImg"]]] forState:UIControlStateNormal];
        
        return cell1;
    }

    return NULL;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected %ld",(long)indexPath.item);
}

-(void)amenitiesAction:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    NSLog(@"Amenities %ld",(long)btn.tag);
}



- (IBAction)ownerAction:(id)sender {
  
    if(_ownerBtn.backgroundColor==[UIColor orangeColor])
    {
        
        [_ownerBtn setBackgroundColor:[UIColor whiteColor]];
        [_ownerBtn setTitleColor:[UIColor colorWithRed:0.0 green:(122.0/256.0) blue:(256.0/256.0) alpha:1.0] forState:UIControlStateNormal];
    }
    else
    {
        [_ownerBtn setBackgroundColor:[UIColor orangeColor]];
        [_ownerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    }
}

- (IBAction)brokerAction:(id)sender {
}

- (IBAction)builderAction:(id)sender {
    
}
- (IBAction)underConstructionAction:(id)sender {
}

- (IBAction)readyToMoveAction:(id)sender {
}
- (IBAction)bedroomAction:(id)sender
{
    //tag = 1
}
- (IBAction)bathroomAction:(id)sender {
}
- (IBAction)carParkingsAction:(id)sender {
    NSLog(@"Parking Pressed");
}
@end
