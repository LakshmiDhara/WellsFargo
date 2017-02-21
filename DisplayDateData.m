//
//  DisplayDateData.m
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/20/17.
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
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    NSString *monthName = [[formatter monthSymbols] objectAtIndex:([components month]-1)];
    NSLog(@"month name %@",monthName);
   
    self.monthName =monthName;
  
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = range.length;
        //Show the display from the current date to end of the month
    self.daysCount =  numberOfDaysInMonth -[components day] +1;
    
    
    NSLog(@"days %d", self.daysCount);
   
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    int weekday = (int)[comps weekday] ;
    NSLog(@"The week day number: %d", weekday);
    self.daysInWeekArray = [[NSMutableArray alloc]init];
    self.dateInMonthArray = [[NSMutableArray alloc]init];
    int i =(int) [components day];
  
        for(int count=i;count<=numberOfDaysInMonth;count++)
    {
      
        NSDate *date = [NSDate date];
      
        [formatter setDateFormat:@"yyyy-MM-dd"];
       
        date = [formatter dateFromString:[NSString stringWithFormat:@"%@%d",@"2017-02-",count]];
        NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
        
        long daysInWeek = [comps weekday];
      
        switch (daysInWeek) {
            case 1:
                
                [self.daysInWeekArray addObject:@"SUN"];
                break;
            case 2:
                [self.daysInWeekArray addObject:@"MON"];
                 break;
            case 3:
                [self.daysInWeekArray addObject:@"TUE"];
                 break;
            case 4:
                [self.daysInWeekArray addObject:@"WED"];
                 break;
            case 5:
                [self.daysInWeekArray addObject:@"THR"];
                 break;
            case 6:
                [self.daysInWeekArray addObject:@"FRI"];
                 break;
            case 7:
                [self.daysInWeekArray addObject:@"SAT"];
                break;
            default:
                NSLog(@"error");
                
        }
        
     
        
        
    }
    
    long j = [components day];
    while (j <= numberOfDaysInMonth )
    {
        [_dateInMonthArray addObject:[NSString stringWithFormat:@"%ld",j]];
        j= j+1;
    }

    
    self.timeInDayArray = [[NSMutableArray alloc]initWithObjects:@"09:00 AM",@"10:00 AM",@"11:00 AM",@"12:00 PM",@"01:00 PM",@"02:00 PM",@"03:00 PM",@"04:00 PM",@"05:00 PM",@"06:00 PM",@"07:00 PM",@"08:00 PM", nil];
}

return self;
}

@end
