//
//  TabBarManager.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 27/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import UIKit

class TabBarManager: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        selectedViewController?.dismiss(animated: true, completion: nil)
        if let title = viewController.title, title == "More" {
            //do your custom actions
            //let controller = ModalController.init()
            //controller.modalPresentationStyle = .overCurrentContext
            //selectedViewController?.present(controller, animated: true, completion: nil)
            return false
        }
        return true
    }
    
}
