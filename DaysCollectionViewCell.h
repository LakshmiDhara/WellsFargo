//
//  DaysCollectionViewCell.h
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/8/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DaysCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *viewTime;
@property (weak, nonatomic) IBOutlet UIView *viewDate;
@property (weak, nonatomic) IBOutlet UILabel *daysDisplay;
@property (weak, nonatomic) IBOutlet UILabel *dataDisplay;
@property (weak, nonatomic) IBOutlet UILabel *timeDisplay;
@property (weak, nonatomic) IBOutlet UIImageView *monthImg;
@property (weak, nonatomic) IBOutlet UIImageView *timeImg;

@end
