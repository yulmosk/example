//
//  TabBarManager.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 27/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var presenter: TabBarPresenter?
    
    override func viewDidLoad() {
        TabBarRouter.createTabBarModule(tabController: self)
        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //Смотрим куда идем, если это Cabinet, History, Menu, то делаем предварительную проверку на автризацию пользователя
        if let title = viewController.title, let index = Constants.items.index(of: title){
            switch index {
                case 1...2:
                    selectedViewController?.dismiss(animated: false, completion: nil)
                    presenter?.checkAuth(index: index, tabController: self) 
                    return false
                case 3:
                    let controller = MenuController.init()
                    controller.modalPresentationStyle = .overCurrentContext
                    selectedViewController?.present(controller, animated: false, completion: nil)
                return false
                default:
                    selectedViewController?.dismiss(animated: false, completion: nil)
                    return true
            }
        }
        
        
        /*print("Selected Index: \(selectedIndex)")
        print("Откуда идем: \(selectedViewController?.title)")
        print("Куда идем: \(viewController.title)")
        selectedViewController?.dismiss(animated: true, completion: nil)
        if let title = viewController.title, title == "Menu" {
            //do your custom actions
            //let controller = ModalController.init()
            //controller.modalPresentationStyle = .overCurrentContext
            //selectedViewController?.present(controller, animated: true, completion: nil)
            return false
        }*/
        return true
    }
    
}
