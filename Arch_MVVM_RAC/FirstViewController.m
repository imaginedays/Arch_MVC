//
//  FirstViewController.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/12.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "FirstViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface FirstViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *entry;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
