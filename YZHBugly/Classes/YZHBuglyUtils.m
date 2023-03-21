//
//  YZHBuglyUtils.m
//  YZHBugly
//
//  Created by NO NAME on 2023/3/20.
//

#import "YZHBuglyUtils.h"
#import <Bugly/Bugly.h>

@interface YZHBuglyUtils () <BuglyDelegate>

@end

@implementation YZHBuglyUtils

+ (instancetype)shared {
    static YZHBuglyUtils *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[YZHBuglyUtils alloc] init];
    });
    return _shared;
}

- (void)configBuglyWithAppId:(NSString *)appId AppKey:(NSString *)AppKey {
    BuglyConfig * config = [[BuglyConfig alloc] init];
#if DEBUG
    config.debugMode = YES;
    config.blockMonitorEnable = YES;
    config.blockMonitorTimeout = 1.5;
    config.channel = @"debug";
#else
    config.channel = @"release";
#endif
    // Set the app channel to deployment
    config.delegate = self;
    config.consolelogEnable = NO;
    config.viewControllerTrackingEnable = NO;
    [Bugly setUserIdentifier:[NSString stringWithFormat:@"User: %@", [UIDevice currentDevice].name]];
    
    [Bugly setUserValue:[NSProcessInfo processInfo].processName forKey:@"Process"];
    // NOTE:Required
    // Start the Bugly sdk with APP_ID and your config
    [Bugly startWithAppId:appId
#if DEBUG
        developmentDevice:YES
#endif
                   config:config];

}


- (void)reportException:(NSException *)exception{
    [Bugly reportException:exception];
}

- (void)reportError:(NSError *)error{
    [Bugly reportError:error];
}

#pragma mark - BuglyDelegate
- (NSString *)attachmentForException:(NSException *)exception {
    return @"This is an attachment";
}

@end
