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
    var selectedViewController: UIViewController?
   
    func showRegister(view:LoginController,index:Int){
        router?.presentRegister(view: view,tabController:tabsView,index:index,selectedViewController:selectedViewController)
    }
    
    func loginTapped(index:Int){
        Auth.shared.saveTicket(ticket: "abc")
        if(index == 3){
             router?.openMenu(index:index, tabController: tabsView, selectedViewController: selectedViewController)
        } else {
             router?.openTab(index: index, tabController: tabsView)
        }
    }
}
