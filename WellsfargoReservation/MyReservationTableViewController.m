//
//  MyReservationTableViewController.m
//  projectWells
//
//  Created by Lakshmi on 2/7/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//

/*START.Functionality implemented in this Controller.
 *Fetch the data from the CORE DATA and display in tableview along with static data.
 * + button used to move to spaservice ViewController for reservation.
 *Implemented refresh control for tableview.
 */
#import "MyReservationTableViewController.h"

@interface MyReservationTableViewController ()
{
    NSManagedObject *allReservations;
    NSMutableArray *reservArray;
    UIRefreshControl *refreshController;
}

@end

@implementation MyReservationTableViewController
@synthesize tableView=_tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Core Data to fetch the reservation service details.
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *moc = delegate.persistentContainer.viewContext;
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *reservation = [NSEntityDescription entityForName:@"Reservation" inManagedObjectContext:moc];
    [fetchRequest setEntity:reservation];
      fetchRequest.returnsObjectsAsFaults = NO;
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"duration =%@",@"1H"]];
   NSArray *array = [moc executeFetchRequest:fetchRequest error:&error];
    
    NSLog(@"Reservation Count %lu", (unsigned long)[array count]);
    reservArray = [[NSMutableArray alloc]initWithArray:array];
    NSLog(@"entity %@",reservArray);
    
    //START . BELOW CODE TO DELETE TEH CORE DATA OBJECT
   /*
    for (NSManagedObject *managedObject in array) {
        [moc deleteObject:managedObject];
        
    }
    
    NSError * error1 = nil;
    if (![moc save:&error])
    {
        NSLog(@"Error ! %@", error1);
    }
    [self.tableView reloadData];
   */
    
    //START .Refresh Control Implementation.
     refreshController = [[UIRefreshControl alloc] init];
    [refreshController addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshController];
}
-(void)handleRefresh : (id)sender
{
    NSLog (@"Pull To Refresh Method Called");
    [refreshController endRefreshing];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.title = @"MY Reservation";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

   // self.nav.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

  UIImage *img = [IonIcons imageWithIcon:ion_plus
                                                           iconColor:[UIColor whiteColor]
                                                            iconSize:30.0f
                                                           imageSize:CGSizeMake(90.0f, 90.0f)];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                    initWithImage:img
                                    style:UIBarButtonItemStylePlain
                                    target:self action:@selector(registerUser)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    self.navigationController.navigationBarHidden = NO;
    
    //This is not display Empty Cells in Table View
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}
-(void)registerUser
{
    //Move to the destination view controller.
    NSString *storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"SpaService"];
    [self presentViewController:vc animated:YES completion:nil];
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if ([reservArray count] == 0)
    { NSLog(@"number of rows");
        return 1;
        
    }
       else
       {
           return reservArray.count+1;
       }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row ==0)
    {
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.date.text = @"Monday, March 26,2016";
    cell.time.text = @"2 PM";
    cell.name.text =@"Gel Manicure";
    cell.partySize.text = @"PARTY SIZE - 1";
    cell.duration.text = @"30M";
    cell.serviceDescription.text = @"Get the upper hand with our chip-resistant, mirror-finish gel polish that requires no drying time and last up to two weeks.";
   // cell.serviceName.text = "Gel Manicure"

    return cell;
    }
    else
    {
        ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        Reservation *reservCustomer = [reservArray objectAtIndex:indexPath.row -1];
        cell.date.text = [reservCustomer valueForKey:@"date"];
        cell.time.text = [reservCustomer valueForKey:@"serviceTime"];
        cell.name.text =[reservCustomer valueForKey:@"serviceName"];
        cell.partySize.text = [reservCustomer valueForKey:@"partySize"];
        cell.duration.text = [reservCustomer valueForKey:@"duration"];
        cell.serviceDescription.text =[reservCustomer valueForKey:@"serviceDesc"];
        return cell;

        
        
    }
}


@end
