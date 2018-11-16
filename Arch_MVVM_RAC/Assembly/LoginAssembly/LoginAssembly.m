//
//  LoginAssembly.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/16.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "LoginAssembly.h"
#import "LoginViewController.h"

@implementation LoginAssembly

- (LoginViewController *)createLoginViewController {
    return [TyphoonDefinition withClass:[LoginViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithNibName:bundle:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:@"LoginViewController"];
            [initializer injectParameterWith:nil];
        }];
    }];
}

@end
