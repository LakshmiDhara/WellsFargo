//
//  DisplayDateData.h
//  WellsfargoReservation
//
//  Created by lakshmi on 2/8/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisplayDateData : NSObject
@property(nonatomic,strong) NSString *monthName;
@property int daysCount;
@property(nonatomic,strong) NSMutableArray *daysInWeekArray;
@property(nonatomic,strong) NSMutableArray *dateInMonthArray;
@property(nonatomic,strong) NSMutableArray *timeInDayArray;
@end
