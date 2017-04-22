//
//  ViewController.m
//  practicle
//
//  Created by Nirav Zalavadia on 08/04/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import "ViewController.h"
#import "vegiCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "detailVc.h"


@interface ViewController ()
{
    NSArray *imagesArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tblVw.delegate=self;
    _tblVw.dataSource=self;
    NSMutableArray* array = [NSMutableArray array];
    [array addObject:[NSString stringWithFormat:@"http://i0.wp.com/hypebeast.com/image/2013/01/hot-toys-iron-man-3-mark-xlii-collectible-bust_1.jpg?w=1410&#8243"]];
    [array addObject:[NSString stringWithFormat:@"http://t0.gstatic.com/images?q=tbn:ANd9GcT4PZc648WRoXzxEdLQA9zMGqBx93_um_HxvsjgYhoY3AvDtkzI&#8221"]];
    [array addObject:[NSString stringWithFormat:@"http://i0.wp.com/hypebeast.com/image/2013/03/hot-toys-iron-man-3-iron-patriot-collectible-bust-2.jpg?w=930&#8243"]];
    [array addObject:[NSString stringWithFormat:@"http://t3.gstatic.com/images?q=tbn:ANd9GcTf_6e7G9pIiw7ZlRRPfdq63NP-jRA6tmstL1ji-ZFEVnTkDjSp&#8221"]];
    [array addObject:[NSString stringWithFormat:@"http://4.bp.blogspot.com/-KlZshKtr0DM/UWDGlG1YqtI/AAAAAAAAAFc/Qt89IIY3s6s/s1600/iron-man-3.jpg&#8221"]];
    imagesArr = array;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [imagesArr count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    vegiCell *cell=[tableView dequeueReusableCellWithIdentifier:@"vegCell"];
    
    cell.vegName.text=[NSString stringWithFormat:@"Name %d",(int)indexPath.row];
    [cell.vegImgVw sd_setImageWithURL:[NSURL URLWithString:[imagesArr objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"Default.png"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"detailVc" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"detailVc"])
    {
        detailVc *vc=(detailVc *)[segue destinationViewController];
        vc.latStr=@"27.30";
        vc.lonStr=@"79.20";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
