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
//    MiddleAgesAssembly *assembly = [[MiddleAgesAssembly new] activated];
//    Knight *knight = [assembly performBeforeInjections];
//    NSLog(@"knight");
}

- (void)bindViewModel {
    
    //关联值变化
    RAC(self.viewModel,username) = self.username.rac_textSignal;
    RAC(self.viewModel,pwd) = self.pwd.rac_textSignal;
    RAC(self.loginBtn,enabled) = [self.viewModel loginParameterIsValid];
    
    @weakify(self);
    //关联事件
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.viewModel login];
    }];
    
    //关联网络处理结果
    /*
     1.成功
     */
    [self.viewModel.successObject subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    /*
     2.失败
     */
    [self.viewModel.failureObject subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    /*
     3.错误
     */
    [self.viewModel.errorObject subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginBtnAction:(id)sender {
    
    NSLog(@"loginBtnAction");
}
@end
