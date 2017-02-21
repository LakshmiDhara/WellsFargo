//
//  SearchViewController.h
//  WellsfargoReservation
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationViewController.h"

@interface SearchViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
- (IBAction)Cancel:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@end
