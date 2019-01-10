//
//  RegisterPresenter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 10/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class RegisterPresenter {
    var router: RegisterRouter?
    weak var view: RegisterController?
    var tabsView: UITabBarController?
    
    func registerTapped(index:Int){
        router?.openTab(index: index, tabController: tabsView)
    }

}
