//
//  DisplayDateData.m
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/8/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//

#import "DisplayDateData.h"

/**
 * Creates the number of days in current month, year.
 * number of the days in a month.
 *
 * return A newly created DisplayDateData instance
 **/

@implementation DisplayDateData
-(id)init
{
    self = [super init];
    if(self)
    {
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSCalendarUnit units = NSCalendarUnitYear| NSCalendarUnitMonth |NSCalendarUnitDay;
    NSDateComponents *components = [calendar components:units fromDate:now];
    NSLog(@"Day: %ld", [components day]);
    NSLog(@"Month: %ld", [components month]);
    NSLog(@"Year: %ld", [components year]);
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init] ;
    NSString *monthName = [[df monthSymbols] objectAtIndex:([components month]-1)];
    NSLog(@"month name %@",monthName);
    //self.monthLabel.text = monthName;
    self.monthName =monthName;
    
    NSCalendar *calendar1 = [NSCalendar currentCalendar];
    NSRange range = [calendar1 rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = range.length;
        //Show the display from the current date to end of the month
    self.daysCount = numberOfDaysInMonth -[components day] +1;
    
    
    NSLog(@"days %d", self.daysCount);
    
    
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    int weekday = [comps weekday];
    NSLog(@"The week day number: %d", weekday);
    self.daysInWeekArray = [[NSMutableArray alloc]init];
    self.dateInMonthArray = [[NSMutableArray alloc]init];
    int i = [components day];
    while (i <= numberOfDaysInMonth )
    {
      
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd"];
        //date = [formatter dateFromString:@"2017-02-\(i)"];
        date = [formatter dateFromString:[NSString stringWithFormat:@"%@%d",@"2017-02-",i]];
        NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:date];
        
        long daysInWeek = [comps weekday];
        //   let daysInWeek = calendar.component(.weekday, from: date1!)
        switch (daysInWeek) {
            case 1:
                //  [daysInWeekArray append("Sun")]
                [_daysInWeekArray addObject:@"SUN"];
                break;
            case 2:
                [_daysInWeekArray addObject:@"MON"];
                 break;
            case 3:
                [_daysInWeekArray addObject:@"TUE"];
                 break;
            case 4:
                [_daysInWeekArray addObject:@"WED"];
                 break;
            case 5:
                [_daysInWeekArray addObject:@"THR"];
                 break;
            case 6:
                [_daysInWeekArray addObject:@"FRI"];
                 break;
            case 7:
                [_daysInWeekArray addObject:@"SAT"];
                break;
            default:
                NSLog(@"error");
                
        }
        
        i = i+1;
        
        
    }
    
    long j = [components day];
    while (j <= numberOfDaysInMonth )
    {
        [_dateInMonthArray addObject:[NSString stringWithFormat:@"%ld",j]];
        j= j+1;
    }

    
    _timeInDayArray = [[NSMutableArray alloc]initWithObjects:@"09:00 AM",@"10:00 AM",@"11:00 AM",@"12:00 PM",@"01:00 PM",@"02:00 PM",@"03:00 PM",@"04:00 PM",@"05:00 PM",@"06:00 PM",@"07:00 PM",@"08:00 PM", nil];
}

return self;
}

@end
