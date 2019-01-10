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
    
    func presentRegister(view: UIViewController,tabController: UITabBarController?,index:Int){
        
        let controller = RegisterController.init()
        controller.modalPresentationStyle = .overCurrentContext
        tabController?.present(controller, animated: false, completion: nil)
        RegisterRouter.createRegisterModule(viewController: controller, tabsController: tabController, index:index)
        
    }
    
    class func createLoginModule(viewController: LoginController, tabsController: UITabBarController?,index:Int) {
        let presenter = LoginPresenter()
        
        viewController.presenter = presenter
        viewController.tabIndex = index
        viewController.presenter?.router = LoginRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.tabsView = tabsController
        
    }
}
