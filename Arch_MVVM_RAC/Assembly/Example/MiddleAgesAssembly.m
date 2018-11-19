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

- (Knight *)performBeforeInjections {
    return [TyphoonDefinition withClass:[Knight class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithQuest:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self defaultQuest]];
        }];
        [definition performBeforeInjections:@selector(applyAppTheme)];
    }];
//    return [TyphoonDefinition withClass:[Knight class] configuration:^(TyphoonDefinition *definition) {
//        //Useful for 3rd party frameworks, otherwise just use init
////        definition.performBeforeInjections = @selector(applyAppTheme)];
//        [definition performBeforeInjections:@selector(applyAppTheme)];
//    }];
}
    
- (Knight *)performAfterInjections {
    return [TyphoonDefinition withClass:[Knight class] configuration:^(TyphoonDefinition *definition) {
        //Intializer injection has the advantage that we can assert required
        //state before proceeding, while property injection doesn't. But we
        //can work around this with the following:
        [definition performAfterInjections:@selector(checkStateAfterBuilt)];
    }];
  
}

- (Knight *)performAfterInjectionsWithParameter {
     return [TyphoonDefinition withClass:[Knight class] configuration:^(TyphoonDefinition *definition) {
         [definition performAfterInjections:@selector(registerWithSubscriber:) parameters:^(TyphoonMethod *params) {
             [params injectParameterWith:[self eventSubscriber]];
         }];
     }];
}

- (CavalryMan *)knightWithCollections {
    return [TyphoonDefinition withClass:[CavalryMan class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(favoriteDamsels) with:@[@"May",@"June"]];
    }];
}

- (void)registerWithSubscriber:(id)subsriber {

}

- (void)applyAppTheme {
    NSLog(@"applyAppTheme");
}

- (void)checkStateAfterBuilt {
    NSLog(@"checkStateAfterBuilt");
}
             
- (id)eventSubscriber {
    NSLog(@"checkStateAfterBuilt");
    return nil;
}

- (id<Quest>)defaultQuest {
    return [TyphoonDefinition withClass:[CampaignQuest class]];
}



@end
