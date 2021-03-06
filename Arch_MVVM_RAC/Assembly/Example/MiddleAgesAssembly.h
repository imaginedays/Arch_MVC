//
//  MiddleAgesAssembly.h
//  DITyphoonSample
//
//  Created by imaginedays on 2018/11/16.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "TyphoonAssembly.h"

NS_ASSUME_NONNULL_BEGIN
@class Knight,CavalryMan;
@protocol Quest;

@interface MiddleAgesAssembly : TyphoonAssembly
- (Knight *)basicKnight;
- (CavalryMan *)cavalryMan;
- (id<Quest>)defaultQuest;
- (Knight *)knightWithMethodInjection;
- (Knight *)performBeforeInjections;
- (void)applyAppTheme;
- (void)checkStateAfterBuilt;
- (id)eventSubscriber;
- (void)registerWithSubscriber:(id)subsriber;
- (Knight *)knightWithCollections;
@end

NS_ASSUME_NONNULL_END
