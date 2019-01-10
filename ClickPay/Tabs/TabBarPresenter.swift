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
    
    func checkAuth(index:Int, tabController: UITabBarController?){
        let isLoggedIn = false
        switch isLoggedIn {
        case false:
            //Так как пользователь не залогинен переходим на страницу Логин
            router?.goToLogin(index:index,tabController: tabController)
        default:
            //Так как пользователь залогинен открываем tab
            router?.goToTab(index:index,tabController: tabController)
        }
    }
}
