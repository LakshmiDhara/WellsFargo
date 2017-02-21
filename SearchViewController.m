//
//  SearchViewController.m
//  WellsfargoReservation
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
{
    NSMutableArray *searchArray ;
    NSMutableArray *searchDescArray ;
    NSMutableArray *searchPicArray ;
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Sample data given for extea funcationalities.Update the table with sample data and move to display page when clicked.
    searchArray =[[NSMutableArray alloc]initWithObjects:@"Skin Care",@"Hair Care",@"Foot Care", nil];
    searchDescArray =[[NSMutableArray alloc]initWithObjects:@"Skin Care Producst",@"Hair Care Products",@"Foot Care products", nil];
    searchPicArray =[[NSMutableArray alloc]initWithObjects:@"22",@"hairM",@"33", nil];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.hidesBackButton = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return searchArray.count;
}
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
    
}
*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell" forIndexPath:indexPath];
    cell.textLabel.text = [searchArray objectAtIndex:indexPath.row];
  //  cell.detailTextLabel.text =  [searchDescArray objectAtIndex:indexPath.row];
   // cell.imageView.image =[UIImage imageNamed:[searchPicArray objectAtIndex:indexPath.row]];
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AnimationViewController *vc = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    vc.name = [searchArray objectAtIndex:indexPath.row];
    
}

- (IBAction)Cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
     
}
@end
