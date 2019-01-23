//
//  AnotherUserDetailViewController.swift
//  XNGNotificationProxyDemo
//
//  Created by XuNing on 2019/1/22.
//  Copyright © 2019 xuning. All rights reserved.
//

import UIKit

class AnotherUserDetailViewController: UIViewController {

    @IBAction func follow(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        XNGNotificationProxy.shared().userDidFollow(sender.isSelected, userID: 123456)
    }

}
