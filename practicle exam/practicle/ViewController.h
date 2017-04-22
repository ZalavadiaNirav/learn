//
//  ViewController.h
//  practicle
//
//  Created by Nirav Zalavadia on 08/04/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NSURLSessionDelegate>
{
    NSURLSession *session;

}


@property (strong, nonatomic) IBOutlet UITableView *tblVw;

@end

