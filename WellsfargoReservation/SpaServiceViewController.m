//
//  SpaServiceViewController.m
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/7/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//
/*START.Functionality implemented in this controller.
 *Reserve is applicable for only Hot Stone Massage.
 *ALERT Message shown when RESERVE clicked for other MAssage.
 *swipe left and swipe right is extended infinitely to select the page.
 */
#import "SpaServiceViewController.h"

@interface SpaServiceViewController ()


@end

@implementation SpaServiceViewController
{
    NSMutableArray *imgArray ;
    int index;
    int maxImages;
    NSMutableArray *tableList;
    BOOL reserveAllowed;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //START. Swipe Recognizer is assigned.Left Swipe recognizer and right recognizer.Using direction attribute can find either left or right swipe.
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    imgArray= [[NSMutableArray alloc]initWithObjects:@"11.png",@"22.png",@"33.png",nil];
    index = 0;
    self.pgCtrl.currentPage = index;
    maxImages = 2;
    tableList = [[NSMutableArray alloc]initWithObjects:@"Swedish Massage",@"Deep Tissue Massage",@"Hot Stone Massage",@"Reflexology",@"Trigger Point Theraphy", nil];
    [self.tableView reloadData];
    self.navigationItem.title = @"SPA SERVICE";
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.hidesBackButton = YES;
    self.search.tintColor = [UIColor whiteColor];
   
    //Set the background and text color for navigation bar.
    
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor whiteColor]};
    self.navBar.tintColor  = [UIColor whiteColor];
    self.navBar.barTintColor  =[UIColor colorWithRed:97/255. green:179/255. blue:235/255. alpha:1];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];                                  
    reserveAllowed = NO;
    
}

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe
{
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        
        if (index >= maxImages )
        {
            index = 0;
        }
        else
        {
            index = index+1;
            
            
        }
       
        if (index ==1)
        {
            reserveAllowed = YES;
        }
        else
        {
            reserveAllowed = NO;

        }
       
        
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight)
    {
        
            index = index -1;
            
        if(index < 0)
        {
            index = maxImages;
            
        }
        
        if (index ==1)
        { 
            reserveAllowed = YES;
        }
        else
        {
            reserveAllowed = NO;
            
        }
        
    }
    //Set the imageview based on the swipe idenetified by left swipe or right swipe.
    self.pgCtrl.currentPage = index;
    self.imgView.image = [UIImage imageNamed:[imgArray objectAtIndex:index]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableList.count;
    }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [tableList objectAtIndex:indexPath.row];
        return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[tableList objectAtIndex:indexPath.row] isEqualToString:@"Hot Stone Massage"])
    {
        
        [self performSegueWithIdentifier:@"Hot Stone Massage" sender:self];
    }
}


- (IBAction)ReservePressed:(UIButton *)sender {
    if (reserveAllowed == YES)
    {
        //Move to next controller to reserve for HOt Stone Massage only.
        [self performSegueWithIdentifier:@"Hot Stone Massage" sender:self];
    }
    else{
        //Alert Message for other Massage other than Hot Stone Massage.
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Reservation is not applicable for this Massage" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
