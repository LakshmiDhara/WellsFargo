//
//  MyReservationTableViewController.h
//  projectWells
//
//  Created by Lakshmi on 2/7/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IonIcons.h"
#import "AppDelegate.h"
#import "ListTableViewCell.h"
#import "Reservation+CoreDataProperties.h"

@interface MyReservationTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
