//
//  LoginModel.h
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/16.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "RWModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginModel : RWModel
@property (nonatomic, copy) NSString *username;    //!< 属性名称
@property (nonatomic, copy) NSString *pwd;    //!< 属性名称
@end

NS_ASSUME_NONNULL_END
