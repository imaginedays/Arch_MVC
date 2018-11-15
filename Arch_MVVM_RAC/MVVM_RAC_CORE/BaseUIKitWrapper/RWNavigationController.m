//
//  RWNavigationController.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/15.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "RWNavigationController.h"

@interface RWNavigationController ()

@end

@implementation RWNavigationController

- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}


@end
