//
//  MyReservationTableViewController.h
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/20/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IonIcons.h"
#import "AppDelegate.h"
#import "ListTableViewCell.h"
#import "Reservation+CoreDataProperties.h"

@interface MyReservationTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
