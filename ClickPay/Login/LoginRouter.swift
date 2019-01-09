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
    
    func presentRegister(view: UIViewController,tabsView: UITabBarController?){
        
        let controller = RegisterController.init()
        controller.modalPresentationStyle = .overCurrentContext
        tabsView?.present(controller, animated: false, completion: nil)
        
    }
    
    class func createLoginModule(viewController: LoginController, tabsController: UITabBarController?) {
        let presenter = LoginPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = LoginRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.tabsView = tabsController
        
    }
}
