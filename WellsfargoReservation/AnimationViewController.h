//
//  AnimationViewController.h
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/8/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
- (IBAction)cancelPage:(UIBarButtonItem *)sender;
@property (nonatomic,strong) NSString *name;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *picture;

@end
