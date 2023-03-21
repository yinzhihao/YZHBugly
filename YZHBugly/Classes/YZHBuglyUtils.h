//
//  YZHBuglyUtils.h
//  YZHBugly
//
//  Created by NO NAME on 2023/3/20.
//

#import <Foundation/Foundation.h>

@interface YZHBuglyUtils : NSObject

+ (instancetype)shared;

- (void)configBuglyWithAppId:(NSString *)appId AppKey:(NSString *)AppKey;

- (void)reportException:(NSException *)exception;

- (void)reportError:(NSError *)error;

@end
