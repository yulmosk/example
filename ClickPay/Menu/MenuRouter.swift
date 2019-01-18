//
//  MenuRouter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 17/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class MenuRouter {
    
    func openLink(controller: UIViewController, view: UIViewController?){
        DispatchQueue.main.async {
            view?.present(controller, animated: true)
        }
    }
    
    class func createMenuModule(viewController: MenuController, tabsController: UITabBarController?,selectedViewController: UIViewController?) {
        let presenter = MenuPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MenuRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.tabsView = tabsController
        viewController.presenter?.selectedViewController = selectedViewController
        
    }
}
