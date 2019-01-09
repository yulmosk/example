//
//  YourCabinetRouter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 04/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class YourCabinetRouter {
    
    func presentLogin(view: UIViewController){
        let controller = LoginController.init()
        controller.modalPresentationStyle = .overCurrentContext
        view.navigationController?.tabBarController?.present(controller, animated: true, completion: nil)
        
        LoginRouter.createLoginModule(viewController: controller, tabsController: view.navigationController?.tabBarController)
    }
    
    class func createYourCabinetModule(viewController: YourCabinetController) {
        let presenter = YourCabinetPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = YourCabinetRouter()
        viewController.presenter?.view = viewController
    }
}
