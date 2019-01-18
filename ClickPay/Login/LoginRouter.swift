//
//  LoginWireFrame.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 01/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter {
    
    func openTab(index:Int, tabController: UITabBarController?)
        {
        tabController?.selectedIndex = index
        tabController?.dismiss(animated: true, completion: nil)
            
    }
    func openMenu(index:Int, tabController: UITabBarController?,selectedViewController: UIViewController?){
        let controller = MenuController.init()
        controller.modalPresentationStyle = .overCurrentContext
        selectedViewController?.present(controller, animated: false, completion: nil)
         tabController?.dismiss(animated: true, completion: nil)
        MenuRouter.createMenuModule(viewController: controller, tabsController: tabController, selectedViewController:selectedViewController)
    }
    
    func presentRegister(view: UIViewController,tabController: UITabBarController?,index:Int,selectedViewController: UIViewController?){
        
        let controller = RegisterController.init()
        controller.modalPresentationStyle = .overCurrentContext
        tabController?.present(controller, animated: true, completion: nil)
        RegisterRouter.createRegisterModule(viewController: controller, tabsController: tabController, index:index, selectedViewController:selectedViewController)
        
    }
    
    class func createLoginModule(viewController: LoginController, tabsController: UITabBarController?,index:Int,selectedViewController: UIViewController?) {
        let presenter = LoginPresenter()
        
        viewController.presenter = presenter
        viewController.tabIndex = index
        viewController.presenter?.router = LoginRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.tabsView = tabsController
        viewController.presenter?.selectedViewController = selectedViewController
        
    }
}
