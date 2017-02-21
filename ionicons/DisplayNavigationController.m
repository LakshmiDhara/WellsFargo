//
//  DisplayNavigationController.m
//  WellsfargoReservation
//
//  Created by Admin on 2/7/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "DisplayNavigationController.h"

@interface DisplayNavigationController ()

@end

@implementation DisplayNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor =[UIColor colorWithRed:97/255. green:179/255. blue:235/255. alpha:1];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

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

@end
