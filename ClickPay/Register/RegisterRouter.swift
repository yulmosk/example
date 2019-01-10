//
//  RegisterRouter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 10/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class RegisterRouter {
    
    func openTab(index:Int, tabController: UITabBarController?)
    {
        tabController?.selectedIndex = index
        tabController?.dismiss(animated: true, completion: nil)
        
    }
    
    class func createRegisterModule(viewController: RegisterController, tabsController: UITabBarController?,index:Int) {
        let presenter = RegisterPresenter()
        
        viewController.presenter = presenter
        viewController.tabIndex = index
        viewController.presenter?.router = RegisterRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.tabsView = tabsController
        
    }
}
