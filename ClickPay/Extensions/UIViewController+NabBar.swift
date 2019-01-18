//
//  UIViewController+NabBar.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 16/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showNavbarLogo(_ show: Bool) {
        if show == true {
            let imageView = UIImageView(image: UIImage(named: "NavLogo"))
            imageView.contentMode = .scaleAspectFit
            navigationItem.titleView = imageView
        } else {
            navigationItem.titleView = nil
        }
    }
    func showNotificationBarItem(_ show: Bool) {
        if show {
            //let isLoggedIn = true
            //guard isLoggedIn else { return }
            
            let view = UserNotificationsView(
                frame: CGRect(x: 0, y: 0, width: 40, height: 40)
            )
            view.addTarget(self, action: #selector(showMessages), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: view)
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func showCardBarItem(_ show: Bool) {
        if show {
                let imageView = UIImageView(image: UIImage(named: "IconCard"))
                imageView.contentMode = .scaleAspectFit
                navigationItem.leftBarButtonItem = UIBarButtonItem(customView: imageView)
        } else {
            navigationItem.leftBarButtonItem = nil
        }
    }
    
    func visibleNotificationView()
        -> UserNotificationsView?
    {
        guard let vc = navigationController?.topViewController,
            let barItem = vc.navigationItem.rightBarButtonItem,
            let notificationView = barItem.customView as? UserNotificationsView
            else {
                return nil
        }
        return notificationView
    }
    
    @objc private func showMessages() {
        let viewController = MessagesController.init()
        //self.navigationController?.pushViewController(viewController, animated: true)
        self.navigationController?.present(viewController,animated: true)
    }
}
