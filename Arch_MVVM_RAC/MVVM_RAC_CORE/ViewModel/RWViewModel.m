//
//  RWViewModel.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/14.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "RWViewModel.h"

@implementation RWViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _successObject = [RACSubject subject];
        _failureObject = [RACSubject subject];
        _errorObject = [RACSubject subject];
    }
    return self;
}

@end
