//
//  RWTabBarController.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/20.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "RWTabBarController.h"
#import "RWHomeViewController.h"
#import "RWFindViewController.h"
#import "RWActivityViewController.h"
#import "RWMineViewController.h"
#import "RWContainerNavigationController.h"

@interface RWTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) RWContainerNavigationController *homeContainerNC;
@property (nonatomic, strong) RWHomeViewController *homeVC;

@property (nonatomic, strong) RWContainerNavigationController *findContainerNC;
@property (nonatomic, strong) RWFindViewController *findVC;

@property (nonatomic, strong) RWContainerNavigationController *activityContainerNC;
@property (nonatomic, strong) RWActivityViewController *activityVC;

@property (nonatomic, strong) RWContainerNavigationController *mineContainerNC;
@property (nonatomic, strong) RWMineViewController *mineVC;

@end

@implementation RWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self rw_initTabBarController];
}

- (void)rw_initTabBarController {
    
    self.homeVC = [[RWHomeViewController alloc]initWithNibName:@"RWHomeViewController" bundle:nil];
    self.homeVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Home" image:[[UIImage imageNamed:@"tab"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    self.homeContainerNC  = [[RWContainerNavigationController alloc]initWithRootViewController:self.homeVC];
    
    self.findVC = [[RWFindViewController alloc]initWithNibName:@"RWFindViewController" bundle:nil];
    self.findVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Find" image:[[UIImage imageNamed:@"tab2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    self.findContainerNC  = [[RWContainerNavigationController alloc]initWithRootViewController:self.findVC];
    
    self.activityVC = [[RWActivityViewController alloc]initWithNibName:@"RWActivityViewController" bundle:nil];
    self.activityVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Activity" image:[[UIImage imageNamed:@"tab"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    self.activityContainerNC  = [[RWContainerNavigationController alloc]initWithRootViewController:self.activityVC];
    
    self.mineVC = [[RWMineViewController alloc]initWithNibName:@"RWHomeViewController" bundle:nil];
    self.mineVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Mine" image:[[UIImage imageNamed:@"tab"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    self.mineContainerNC  = [[RWContainerNavigationController alloc]initWithRootViewController:self.mineVC];
    
    self.viewControllers = @[self.homeContainerNC,self.findContainerNC,self.activityContainerNC,self.mineContainerNC];
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
