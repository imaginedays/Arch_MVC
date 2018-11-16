//
//  RWViewModel.h
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/14.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RWNavigationProtocol;
@protocol RWRepositoryServiceProtocol;
@interface RWViewModel : NSObject
@property (nonatomic, assign) id<RWNavigationProtocol> navigator;           //!< 路由
@property (nonatomic, assign) id<RWRepositoryServiceProtocol> service;      //!< 服务
@end

NS_ASSUME_NONNULL_END
