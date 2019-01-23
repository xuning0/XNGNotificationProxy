//
//  FirstViewController.m
//  XNGNotificationProxyDemo
//
//  Created by XuNing on 2019/1/22.
//  Copyright © 2019 xuning. All rights reserved.
//

#import "FirstViewController.h"
#import "XNGNotificationProxy+Protocol.h"

@interface FirstViewController () <UserStateProtocol, UserActionProtocol>
@property (weak, nonatomic) IBOutlet UILabel *userStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *followStateLabel;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[XNGNotificationProxy sharedProxy] registerProtocol:@protocol(UserStateProtocol) forObject:self];
    [[XNGNotificationProxy sharedProxy] registerProtocol:@protocol(UserActionProtocol) forObject:self];
}

#pragma mark - UserStateProtocol
- (void)userDidLogin {
    self.userStateLabel.hidden = NO;
    self.userStateLabel.text = @"logged in";
}

#pragma mark - UserActionProtocol
- (void)userDidFollow:(BOOL)isFollow userID:(NSNumber *)userID {
    self.followStateLabel.hidden = NO;
    self.followStateLabel.text = [NSString stringWithFormat:@"%@ user(id == %@)", isFollow ? @"followed" : @"unfollowed", userID];
}

@end
