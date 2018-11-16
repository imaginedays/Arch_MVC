//
//  CavalryMan.h
//  DITyphoonSample
//
//  Created by imaginedays on 2018/11/16.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quest.h"
NS_ASSUME_NONNULL_BEGIN

@interface CavalryMan : NSObject
@property (nonatomic, assign) id<Quest> quest;    //!< 属性名称
@property (nonatomic, assign) NSInteger damselsRescued;    //!< 属性名称
@end

NS_ASSUME_NONNULL_END
