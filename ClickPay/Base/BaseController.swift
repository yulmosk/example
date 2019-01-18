//
//  BaseController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 17/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavbarLogo(true)
        
        if Auth.shared.isAuth() {
            showNotificationBarItem(true)
            if let notificationView = visibleNotificationView() {
                notificationView.setNotificationsCount(89, animated: true)
            }
        }
    }
    

}
