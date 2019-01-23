# XNGNotificationProxy

English | [中文](https://www.jianshu.com/p/3fe728c4d7a3)

XNGNotificationProxy is a replacement of custom NSNotification.

## A common scenario of NSNotification in use

You followed a user in VC_U, so the follow buttons in VC_A and VC_B should update state.

```
// VC_U.m

[[NSNotificationCenter defaultCenter] postNotificationName:@"UserDidFollowUser"
                                                    object:nil
                                                  userInfo:@{@"isFollowed": @(YES), @"userID": @(123456)}];
```
```
// VC_A.m or VC_B.m

[[NSNotificationCenter defaultCenter] addObserverForName:@"UserDidFollowUser"
                                                  object:nil
                                                   queue:nil
                                              usingBlock:^(NSNotification * _Nonnull note) {
                                                  BOOL isFollowed = [note.userInfo[@"isFollowed"] boolValue];
                                                  NSNumber *userID = note.userInfo[@"userID"];
                                              }];
```
There are a lot of magic strings. We may define some global constant strings to solve this, but we can never know what parameters are in the userInfo intuitively.

## Use XNGNotificationProxy

You need create a category for XNGNotificationProxy that conforms a custom protocol first.
```
// XNGNotificationProxy+Protocol.h

@protocol UserActionProtocol <NSObject>
@optional
- (void)userDidFollow:(BOOL)isFollowed userID:(NSNumber *)userID;
@end


@interface XNGNotificationProxy (Protocol) <UserActionProtocol>
@end
```
then
```
// VC_U.m

[[XNGNotificationProxy sharedProxy] userDidFollow:YES userID:@(123456)];
```
```
// VC_A.m

@interface VC_A () <UserActionProtocol>
@end

// -viewDidLoad or somewhere else
[[XNGNotificationProxy sharedProxy] registerProtocol:@protocol(UserActionProtocol) forObject:self];

// 
- (void)userDidFollow:(BOOL)isFollowed userID:(NSNumber *)userID {
    // do something
}
```

## Requirements

iOS 7.0 or later.

## Installation

There are two ways to use XNGNotificationProxy in your project:
- using CocoaPods
- drag `XNGNotificationProxy` folder into your project

## Licenses

XNGNotificationProxy is released under the MIT license. See [LICENSE](https://github.com/xuning0/XNGNotificationProxy/blob/master/LICENSE) for details.




