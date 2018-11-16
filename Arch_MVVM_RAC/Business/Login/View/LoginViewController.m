//
//  LoginViewController.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/15.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "LoginViewController.h"

#import "LoginViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "MiddleAgesAssembly.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    RAC(self.viewModel,username) = self.username.rac_textSignal;
    RAC(self.viewModel,pwd) = self.pwd.rac_textSignal;
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
