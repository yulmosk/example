//
//  TabBarRouter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 10/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class TabBarRouter {
    
    func goToLogin(index:Int, tabController: UITabBarController?){
        let controller = LoginController.init()
        controller.modalPresentationStyle = .overCurrentContext
        tabController?.present(controller, animated: true, completion: nil)
        
        LoginRouter.createLoginModule(viewController: controller, tabsController: tabController, index:index)
    }
    
    
    func goToTab(index:Int, tabController: UITabBarController?){
        tabController?.selectedIndex = index
    }
    
    func openMenu(index:Int, tabController: UITabBarController?){
        let controller = MenuController.init()
        controller.modalPresentationStyle = .overCurrentContext
        tabController?.present(controller, animated: false, completion: nil)
    }
    
    class func createTabBarModule(tabController: TabBarController) {
        let presenter = TabBarPresenter()
        
        tabController.presenter = presenter
        tabController.presenter?.router = TabBarRouter()
        tabController.presenter?.view = tabController
    }
    
}
