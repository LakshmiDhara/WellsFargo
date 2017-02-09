//
//  SpaServiceViewController.h
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/7/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpaServiceViewController : UIViewController <UITableViewDelegate , UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIPageControl *pgCtrl;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)ReservePressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *search;

@end
