//
//  MiddleAgesAssembly.m
//  DITyphoonSample
//
//  Created by imaginedays on 2018/11/16.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "MiddleAgesAssembly.h"
#import "Knight.h"
#import "CampaignQuest.h"
#import "CavalryMan.h"

@implementation MiddleAgesAssembly


/**
 构造行数注入

 @return <#return value description#>
 */
- (Knight *)basicKnight {
    return [TyphoonDefinition withClass:[Knight class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithQuest:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self defaultQuest]];
        }];
    }];
}


/**
 属性注入

 @return <#return value description#>
 */
- (CavalryMan *)cavalryMan {
    return [TyphoonDefinition withClass:[CavalryMan class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(quest) with:[self defaultQuest]];
        [definition injectProperty:@selector(damselsRescued) with:@(12)];
    }];
}


/**
 方法注入

 @return <#return value description#>
 */
- (Knight *)knightWithMethodInjection {
    return [TyphoonDefinition withClass:[Knight class] configuration:^(TyphoonDefinition *definition) {
        [definition injectMethod:@selector(setQuest:andDamselsRescued:) parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:[self defaultQuest]];
            [method injectParameterWith:@321];
        }];
    }];
}

- (id<Quest>)defaultQuest {
    return [TyphoonDefinition withClass:[CampaignQuest class]];
}

@end
