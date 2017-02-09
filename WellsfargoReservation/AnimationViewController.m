//
//  AnimationViewController.m
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/8/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Do ANimation with gif images for extra functionality.
    NSArray *array = @[@"11.png",@"22.png",@"33.png",@"11.png",@"22.png",@"33.png"];
    NSMutableArray *animateImages =[[NSMutableArray alloc]init];
    for(int i= 0; i<array.count;i++)
    {
       [animateImages addObject:[UIImage imageNamed:[array objectAtIndex:i]] ];
    }
    
    self.img.animationImages = animateImages;
    self.img.animationDuration = 2.0;
    [self.img startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //START animation when touches began.EXTRA FUNCTIONALITY.
    [self.img startAnimating];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
     //STOP animation when the touches move action done.
    [self.img stopAnimating];
}


@end
