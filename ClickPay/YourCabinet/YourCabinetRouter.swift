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
    
    class func createYourCabinetModule(viewController: YourCabinetController) {
        let presenter = YourCabinetPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = YourCabinetRouter()
        viewController.presenter?.view = viewController
    }
}
