//
//  XNGNotificationProxy+Protocol.h
//  XNGNotificationProxyDemo
//
//  Created by XuNing on 2019/1/23.
//  Copyright © 2019 xuning. All rights reserved.
//

@import XNGNotificationProxy;

NS_ASSUME_NONNULL_BEGIN

@protocol UserStateProtocol <NSObject>
@optional
- (void)userDidLogin;
- (void)userDidLogout;

@end

@protocol UserActionProtocol <NSObject>
@optional
- (void)userDidFollow:(BOOL)isFollow userID:(NSNumber *)userID;

@end


@interface XNGNotificationProxy (Protocol) <UserStateProtocol, UserActionProtocol>

@end

NS_ASSUME_NONNULL_END
