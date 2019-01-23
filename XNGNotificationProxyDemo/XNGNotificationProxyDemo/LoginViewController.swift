//
//  LoginViewController.swift
//  XNGNotificationProxyDemo
//
//  Created by XuNing on 2019/1/22.
//  Copyright © 2019 xuning. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction func login() {
        XNGNotificationProxy.shared().userDidLogin()
        dismiss(animated: true, completion: nil)
    }
    
}
