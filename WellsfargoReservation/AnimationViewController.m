//
//  AnimationViewController.m
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/20/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Do ANimation with gif images for extra functionality.
    NSArray *array = @[@"11",@"22",@"33",@"11",@"22",@"33",@"11",@"22",@"33",@"11",@"22",@"33"];
    NSMutableArray *animateImages =[[NSMutableArray alloc]init];
    for(int i= 0; i<array.count;i++)
    {
       [animateImages addObject:[UIImage imageNamed:[array objectAtIndex:i]] ];
    }
    
    self.img.animationImages = animateImages;
    self.img.animationDuration = 2.0;
    [self.img startAnimating];
    //self.navigationItem.hidesBackButton =NO;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
 //   self.navigationItem.hidesBackButton =NO;
 //self.navigationBar. = NO;
    self.navigationItem.title= @"Massage";
    self.navigationController.navigationBar.titleTextAttributes =@{NSForegroundColorAttributeName:[UIColor blueColor]};
    self.label.text = self.name;
    [self displayImage];
}
-(void)displayImage
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    NSString *string = @"https://cdn.athemes.com/wp-content/uploads/core-spa-theme.jpg";
    NSURL *url = [NSURL URLWithString:string];
    NSData *data = [NSData dataWithContentsOfURL:url];
    dispatch_async(dispatch_get_main_queue(), ^{
    self.picture.image = [UIImage imageWithData:data];
    });
});
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //START animation when touches began.EXTRA FUNCTIONALITY.
    [self.img stopAnimating];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
     //STOP animation when the touches move action done.
  //  [self.img stopAnimating];
}

- (IBAction)cancelPage:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
