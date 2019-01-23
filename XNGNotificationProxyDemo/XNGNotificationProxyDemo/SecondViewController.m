//
//  SecondViewController.m
//  XNGNotificationProxyDemo
//
//  Created by XuNing on 2019/1/22.
//  Copyright © 2019 xuning. All rights reserved.
//

#import "SecondViewController.h"
#import "XNGNotificationProxy+Protocol.h"

@interface SecondViewController () <UserStateProtocol>
@property (weak, nonatomic) IBOutlet UILabel *userStateLabel;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[XNGNotificationProxy sharedProxy] registerProtocol:@protocol(UserStateProtocol) forObject:self];
}

#pragma mark - UserStateProtocol
- (void)userDidLogin {
    self.userStateLabel.hidden = NO;
    self.userStateLabel.text = @"logged in";
}

@end
