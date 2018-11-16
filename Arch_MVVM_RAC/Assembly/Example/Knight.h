//
//  Knight.h
//  DITyphoonSample
//
//  Created by imaginedays on 2018/11/16.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quest.h"
NS_ASSUME_NONNULL_BEGIN

@interface Knight : NSObject
- (instancetype)initWithQuest:(id<Quest>)quest;
- (void)setQuest:(id<Quest>)quest andDamselsRescued:(NSInteger)DamselsRescued;
@end

NS_ASSUME_NONNULL_END
