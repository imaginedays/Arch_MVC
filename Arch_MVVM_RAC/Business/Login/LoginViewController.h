//
//  LoginViewController.h
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/15.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "RWViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : RWViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

NS_ASSUME_NONNULL_END
