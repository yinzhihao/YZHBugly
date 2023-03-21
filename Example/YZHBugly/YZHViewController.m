//
//  YZHViewController.m
//  YZHBugly
//
//  Created by yinzhihao on 03/20/2023.
//  Copyright (c) 2023 yinzhihao. All rights reserved.
//

#import "YZHViewController.h"
#import <YZHBugly/YZHBugly.h>

@interface YZHViewController ()

@end

@implementation YZHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)reportException:(id)sender {
    NSException *exception = [[NSException alloc] initWithName:@"test exception name" reason:@"test" userInfo:@{@"key1":@"value1"}];
    [[YZHBuglyUtils shared] reportException:exception];
}

- (IBAction)reportError:(id)sender {
    NSError *error = [NSError errorWithDomain:@"com.yinzhihao.yzhbugly.demo" code:-1 userInfo:@{@"key1":@"value1"}];
    [[YZHBuglyUtils shared] reportError:error];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
