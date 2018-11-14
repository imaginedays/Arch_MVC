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

/// Initialization method. This is the preferred way to create a new view.
///
/// viewModel - corresponding view model
///
/// Returns a new view.
- (instancetype)initWithViewModel:(RWViewModel *)viewModel;

/// Binds the corresponding view model to the view.
- (void)bindViewModel;

@end

NS_ASSUME_NONNULL_END
