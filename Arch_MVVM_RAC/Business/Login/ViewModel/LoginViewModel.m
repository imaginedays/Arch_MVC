//
//  LoginViewModel.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/16.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "LoginViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface LoginViewModel()
@property (nonatomic, assign) BOOL loginEnabled;    //!< 属性名称

@end
@implementation LoginViewModel
- (instancetype)init {
    self = [super init];
    if (self) {
        _model = [[LoginModel alloc]init];
        RAC(self,loginEnabled) = [RACSignal combineLatest:@[RACObserve(self.model,username), RACObserve(self.model,pwd)] reduce:^(NSString *username, NSString *pwd){
            return @(username.length > 0 && pwd.length > 0);
        }];
    }
    return self;
}
@end
