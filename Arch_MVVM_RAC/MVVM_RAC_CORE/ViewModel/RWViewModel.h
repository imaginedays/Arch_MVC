//
//  RWViewModel.h
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/14.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RWNavigationProtocol;
@protocol RWRepositoryServiceProtocol;
@interface RWViewModel : NSObject
@property (nonatomic, assign) id<RWNavigationProtocol> navigator;           //!< 路由
@property (nonatomic, assign) id<RWRepositoryServiceProtocol> service;      //!< 服务

//请求成功信号
@property (nonatomic, strong) RACSubject *successObject;    //!< 请求成功
@property (nonatomic, strong) RACSubject *failureObject;    //!< 请求失败
@property (nonatomic, strong) RACSubject *errorObject;    //!< 请求错误（网络错误）
@end

NS_ASSUME_NONNULL_END
