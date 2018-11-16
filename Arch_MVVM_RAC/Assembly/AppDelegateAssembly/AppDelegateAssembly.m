//
//  AppDelegateAssembly.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/16.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "AppDelegateAssembly.h"
#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "AppDelegate.h"

@implementation AppDelegateAssembly

- (LoginViewController *)createLoginViewController {
    return [TyphoonDefinition withClass:[LoginViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithNibName:bundle:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:@"LoginViewController"];
            [initializer injectParameterWith:nil];
        }];
        [definition injectProperty:@selector(viewModel) with:[self createLoginViewController]];
    }];
}

- (LoginViewModel *)createLoginViewModel {
    return [[LoginViewModel alloc]init];
}

@end
