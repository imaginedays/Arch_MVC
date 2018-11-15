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
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, copy) NSString *userName;    //!< 用户名
@property (nonatomic, copy) NSString *password;    //!< 密码
@property (nonatomic, copy) NSString *passwordConfirmation;    //!< 密码确认
@property (nonatomic, assign) BOOL createEnabled;    //!< 是否可以创建

@end

@implementation FirstViewController

- (void)rac_usage {
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
    
    /*
     监听username值变化
     */
    [RACObserve(self, userName) subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    /*
     */
    [[RACObserve(self, userName) filter:^BOOL(id  _Nullable value) {
        return [value hasPrefix:@"j"];
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    //创建一个单程绑定,这样当self.password和self.passwordConfirmation一样时self.createEnabled将会变成ture
    //
    // RAC() 宏可以使得绑定表示的更清楚
    //
    // +combineLatest:reduce: 获取一个信号数组,当其中任何一个改变时传递新值并调用这些blocks,并且返回block返回值的一个新RACSignal信号
    //(returns a new RACSignal that sends the return value of that block as values.)
    RAC(self, createEnabled) = [RACSignal
                                combineLatest:@[ RACObserve(self, password), RACObserve(self, passwordConfirmation) ]
                                reduce:^(NSString *password, NSString *passwordConfirm) {
                                    return @([passwordConfirm isEqualToString:password]);
                                }];
    
    NSLog(@"%d",_createEnabled);
    
    // 在按钮点击时打印信息
    // RACCommand 用以表示一个UI事件. 每一个信号可以表示一次点击, 例如,在点击事件时处理额外的事件
    // -rac_command 是 NSButton 的额外方法 . 在点击时,按钮将自身发送给它自己.
    self.button.rac_command = [[RACCommand alloc] initWithSignalBlock:^(id _) {
        NSLog(@"button was pressed!");
        return [RACSignal empty];
    }];
    
//    // 给按钮绑定一个登录事件请求网络
//    //
//    // 在登录命令执行的时候这个block将用以执行登录程序
//    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^(id sender) {
//        // 这个登录命令在网络请求结束后返回发送值得一个信号
//        return [client logIn];
//    }];
//
//    // -executionSignals 返回一个包含上面block的信号,收到一次信号执行一次
//    [self.loginCommand.executionSignals subscribeNext:^(RACSignal *loginSignal) {
//        // 登录成功调用
//        [loginSignal subscribeCompleted:^{
//            NSLog(@"Logged in successfully!");
//        }];
//    }];
//
//    // 按钮点击时执行登录命令
//    self.loginButton.rac_command = self.loginCommand;
    
    // 在两个网络请求结束后打印信息
    //
    // +merge: takes an array of signals and returns a new RACSignal that passes
    // through the values of all of the signals and completes when all of the
    // signals complete.(太长了,求翻译)
    //
    // -subscribeCompleted: 在信号结束后调用
//    [[RACSignal
//      merge:@[ [client fetchUserRepos], [client fetchOrgRepos] ]]
//     subscribeCompleted:^{
//         NSLog(@"They're both done!");
//     }];


}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self rac_usage];
}

@end
