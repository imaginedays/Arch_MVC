//
//  LoginViewModel.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/16.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "LoginViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation LoginViewModel

- (void)login {
    //模拟登录
    NSLog(@"login username =  %@ pwd = %@",self.username,self.pwd);
    _requestData = @[self.username,self.pwd];
    [self.successObject sendNext:_requestData];
    [self.failureObject sendNext:@"failure"];
    [self.errorObject sendNext:@"error"];
    
}

- (id)loginParameterIsValid {
    return [RACSignal combineLatest:@[RACObserve(self, username),RACObserve(self, pwd)] reduce:^(NSString *username, NSString *pwd){
        return @(username.length >= 3 && pwd.length >= 3);
    }];
}

@end
