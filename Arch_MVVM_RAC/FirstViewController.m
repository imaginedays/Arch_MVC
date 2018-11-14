//
//  FirstViewController.m
//  Arch_MVVM_RAC
//
//  Created by imaginedays on 2018/11/12.
//  Copyright © 2018 Robin Wong. All rights reserved.
//

#import "FirstViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface FirstViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *entry;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.entry.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"textfield.text == %@",x);
        self.content.text = x;
    }];
    
     /*
      1. 创建信号
    */
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"发送信号"];
        return nil;
    }];
    
    /*
     2. 订阅信号
     */
    RACDisposable *disposable = [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"信号内容:%@",x);
    }];
    
    /*
     3. 取消订阅
     */
    [disposable dispose];
}

@end
