//
//  LoginPresenter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 01/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class LoginPresenter {
    var router: LoginRouter?
    weak var view: LoginController?
    var tabsView: UITabBarController?
   
    func showRegister(view:LoginController){
        router?.presentRegister(view: view,tabsView:tabsView)
    }
}
