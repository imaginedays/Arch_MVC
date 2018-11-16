//
//  Knight.m
//  DITyphoonSample
//
//  Created by imaginedays on 2018/11/16.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "Knight.h"

@implementation Knight
- (instancetype)initWithQuest:(id<Quest>)quest {
    self = [super init];
    if (self) {
        NSLog(@"initWithQuest");
    }
    return self;
}

- (void)setQuest:(id<Quest>)quest andDamselsRescued:(NSInteger)DamselsRescued {
    
}
@end
