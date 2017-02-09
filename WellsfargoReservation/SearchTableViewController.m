//
//  SearchTableViewController.m
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/8/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

{
    NSMutableArray *searchArray ;
     NSMutableArray *searchDescArray ;
    NSMutableArray *searchPicArray ;
}
@synthesize tableView=_tableView;
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //Sample data given for extea funcationalities.Update the table with sample data and move to display page when clicked.
    searchArray =[[NSMutableArray alloc]initWithObjects:@"Skin Care",@"Hair Care",@"Foot Care", nil];
     searchDescArray =[[NSMutableArray alloc]initWithObjects:@"Skin Care Producst",@"Hair Care Products",@"Foot Care products", nil];
    searchPicArray =[[NSMutableArray alloc]initWithObjects:@"care",@"care",@"care", nil];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

   return searchArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell" forIndexPath:indexPath];
    cell.textLabel.text = [searchArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text =  [searchDescArray objectAtIndex:indexPath.row];
    cell.imageView.image =[UIImage imageNamed:[searchPicArray objectAtIndex:indexPath.row]];
    
    
    return cell;
}



@end
