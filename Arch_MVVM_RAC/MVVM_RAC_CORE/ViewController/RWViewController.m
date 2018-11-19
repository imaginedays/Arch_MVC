//
//  RWViewController.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/14.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "RWViewController.h"
#import "RWViewModel.h"
#import <ReactiveObjC.h>

@interface RWViewController ()
@property (nonatomic, strong, readwrite) RWViewModel *viewModel;
@end

@implementation RWViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    RWViewController *viewController = [super allocWithZone:zone];
    //TODO 改变这个写法
    @weakify(viewController)
    [[viewController
      rac_signalForSelector:@selector(viewDidLoad)]
     subscribeNext:^(id x) {
         @strongify(viewController)
         [viewController bindViewModel];
     }];
    
    return viewController;
}

- (RWViewController *)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}


/**
 viewmodel to model
 */
- (void)bindViewModel {
    NSLog(@"RWViewController bindViewModel");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
