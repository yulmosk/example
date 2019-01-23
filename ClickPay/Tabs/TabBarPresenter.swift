//
//  TabBarPresenter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 10/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class TabBarPresenter {
    var router: TabBarRouter?
    weak var view: TabBarController?
    
    func checkAuth(index:Int, tabController: UITabBarController?,selectedViewController: UIViewController?){
        let isLoggedIn = Auth.shared.isAuth()
        switch isLoggedIn {
        case false:
            //Так как пользователь не залогинен переходим на страницу Логин
            router?.goToLogin(index:index,tabController: tabController,selectedViewController: selectedViewController)
        default:
            //Так как пользователь залогинен открываем tab или menu
            switch index {
                case 1,2:
                    router?.goToTab(index:index,tabController: tabController)
                case 3:
                    router?.openMenu(index:index,tabController: tabController,selectedViewController: selectedViewController)
                default: ()
            }
            
        }
    }
}
