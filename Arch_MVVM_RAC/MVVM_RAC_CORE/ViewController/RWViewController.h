//
//  RWViewController.h
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/14.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class RWViewModel;
@interface RWViewController : UIViewController
@property (nonatomic, strong, readonly) RWViewModel *viewModel;
- (instancetype)initWithViewModel:(RWViewModel *)viewModel;
- (void)bindViewModel;
- (void)refreshViewByTabBarController;    //用于TabBarController 刷新View
@end

NS_ASSUME_NONNULL_END
