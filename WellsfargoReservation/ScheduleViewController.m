//
//  ScheduleViewController.m
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/7/17.
//  Copyright © 2017 Admin. All rights reserved.
//

/*START .Functionality done by the view controller.
 *select date and time for the reservation of the Hot Stone Massage.
 *Party Size will be selected using picker controller.
 *ALERT Message shown when more than one date and time selected.
 */
#import "ScheduleViewController.h"

@interface ScheduleViewController ()

@end

@implementation ScheduleViewController
{
    int daysCount;
    NSMutableArray *daysInWeekArray;
    NSMutableArray *dateInMonthArray;
    NSMutableArray *timeInDayArray;
    NSMutableArray *pickerArray;
    UIPickerView *picker;
    NSString *serviceTime;
    NSString *serviceDate;
    UIBarButtonItem *button1, *button2;
    UIToolbar *toolbar;
    BOOL isDateSelected;
     BOOL isTimeSelected;
    BOOL isPartySizeSelected;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.navigationBar.titleTextAttributes =@{NSForegroundColorAttributeName :[UIColor whiteColor]};
    DisplayDateData *data = [[DisplayDateData alloc]init];
    self.monthLabel.text = data.monthName;
    daysCount = data.daysCount;
    
   isPartySizeSelected = NO;
    //Make the reverve button faded using alpha parameter .alpha
    self.reserveButton.alpha = 0.4;
    self.reserveButton.enabled = NO;
    
    NSLog(@"data dayscount %d",daysCount);
    daysInWeekArray = data.daysInWeekArray;
    timeInDayArray = data.timeInDayArray;
    dateInMonthArray = data.dateInMonthArray;
    
    picker = [[UIPickerView alloc]init];
    picker.frame =CGRectMake(0, self.view.frame.size.height/2-40, self.view.frame.size.width, self.view.frame.size.height/2+40);
    picker.backgroundColor = [UIColor whiteColor];
    
    picker.showsSelectionIndicator = YES;
    picker.delegate = self;
    picker.dataSource = self;
    //Picker data set statically as requiremnt.
    pickerArray =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    [self.view addSubview:picker];
    picker.hidden = true;

    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{  if([collectionView isEqual:self.monthCollectionView])
    {
    
           return daysCount;
    }
    else
    {
        return timeInDayArray.count;
        
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    if([collectionView  isEqual: self.monthCollectionView])
    {
        
        
    DaysCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
  //  cell.daysDisplay.text = [dateInMonthArray objectAtIndex:indexPath.row];
        cell.monthImg.hidden = YES;
    cell.dataDisplay.text =[dateInMonthArray objectAtIndex:indexPath.row];
    cell.daysDisplay.text = [daysInWeekArray objectAtIndex:indexPath.row];
    cell.layer.borderWidth=1.0f;
    cell.layer.borderColor=[UIColor grayColor].CGColor;
        return cell;
    }
    else{
         DaysCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TimeCell" forIndexPath:indexPath];
        cell.timeImg.hidden = YES;
        cell.timeDisplay.text = [timeInDayArray objectAtIndex:indexPath.row];
        cell.layer.borderWidth=1.0f;
        cell.layer.borderColor=[UIColor grayColor].CGColor;
        return cell;
    }

}

- (void )collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if([collectionView  isEqual:self.monthCollectionView])
    {  NSLog(@"didselectrow");
        if(isDateSelected)
        {
            //Display Alert Message when cell already selected.
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"You have already Selected the data " preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else
        {
        DaysCollectionViewCell *cell =[collectionView cellForItemAtIndexPath:indexPath];
        cell.monthImg.hidden = NO;
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
       // [formatter setDateFormat:@"dddd, MMMM dd , yyyy"];
        //date = [formatter dateFromString:@"2017-02-\(i)"];
        [formatter setDateFormat:@"YYYY-MM-dd"];
        date = [formatter dateFromString:[NSString stringWithFormat:@"%@%@",@"2017-02-",cell.dataDisplay.text]];
        
        [formatter setDateFormat:@"EEEE, MMMM dd,yyyy"];
        NSString *ddate = [formatter stringFromDate:date];
        

        NSLog(@"DATE %@", ddate);
        serviceDate = ddate;
        isDateSelected = YES;
        }
        
    }
    else{
        if(isTimeSelected)
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"You have already Selected the time " preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else{
        
        NSLog(@"didselectrow timecell");
         DaysCollectionViewCell *cell =[collectionView cellForItemAtIndexPath:indexPath];
        cell.timeImg.hidden = NO;
        serviceTime = cell.timeDisplay.text;
        isTimeSelected = YES;
            }
    }
    if((isTimeSelected)&&(isDateSelected))
    {
        
        self.reserveButton.alpha = 1;
        self.reserveButton.enabled = YES;
        
    }
    
   
}


#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    self.partyLabel.text = [pickerArray objectAtIndex:row];
    isPartySizeSelected = YES;
    button1.enabled= YES;
    //picker.hidden = YES;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}


- (IBAction)partySPressed:(UIButton *)sender {
    picker.hidden = NO;
    
    //START.Creating toolbar programatically when PARTY SiZE Button pressed.
    toolbar = [[UIToolbar alloc] init];
    
     button1 = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelAction)];
    
     button2=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(sendAction)];
    toolbar.frame =  CGRectMake( 0, picker.frame.origin.y ,  self.view.frame.size.width, picker.frame.size.height/12+3);
    [toolbar setItems:[[NSArray alloc] initWithObjects:button1,button2, nil]];
    button1.enabled = NO;
    [self.view addSubview:toolbar];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [toolbar setItems:[[NSArray alloc] initWithObjects:button1,spacer,button2,nil]];
}

-(void)sendAction
{
     picker.hidden = YES;
   
    toolbar.hidden = YES;
}

-(void)cancelAction
{
     button1.enabled = NO;
}
-(void)save {
    
   //STORE the data in core data for Reservation Entity.
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    Reservation *reserCustomer = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:context];
    
   
    [reserCustomer setValue:serviceDate forKey:@"date"];
    [reserCustomer setValue:self.serviceDuration.text forKey:@"duration"];
    [reserCustomer setValue:[NSString stringWithFormat:@"%@%@",@"PARTY SIZE ",self.partyLabel.text] forKey:@"partySize"];
    [reserCustomer setValue:self.serviceDescription.text forKey:@"serviceDesc"];
    [reserCustomer setValue:self.serviceName.text forKey:@"serviceName"];
    [reserCustomer setValue:serviceTime forKey:@"serviceTime"];
    //[reserCustomer setValue:UserName forKey:@"date"];
    
    NSError *error1;
    if (![context save:&error1])
    {
        NSLog(@"Can't Save! ");
    }

    
}
- (IBAction)reservePressed:(UIButton *)sender {
    if(isPartySizeSelected)
    {
    [self save];
    NSString *storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UINavigationController * vc = [storyboard instantiateViewControllerWithIdentifier:@"MyReservationNC"];
    [self presentViewController:vc animated:YES completion:nil];
    }
    else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Party Size not seleced" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
