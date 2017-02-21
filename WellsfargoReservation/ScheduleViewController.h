//
//  ScheduleViewController.h
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/20/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DaysCollectionViewCell.h"
#import "DisplayDateData.h"
#import "AppDelegate.h"
#import "Reservation+CoreDataProperties.h"

@interface ScheduleViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIView *viewDate;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysDisplay;
@property (weak, nonatomic) IBOutlet UIView *timeView;
@property (weak, nonatomic) IBOutlet UICollectionView *monthCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *timeCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *partySizePressed;
- (IBAction)partySPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *partyLabel;

@property (weak, nonatomic) IBOutlet UILabel *serviceName;
@property (weak, nonatomic) IBOutlet UILabel *serviceDuration;
@property (weak, nonatomic) IBOutlet UILabel *serviceDescription;
- (IBAction)reservePressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *reserveButton;

@end
