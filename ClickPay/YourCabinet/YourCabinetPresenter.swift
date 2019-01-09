//
//  YourCabinetPresenter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 04/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class YourCabinetPresenter {
    var router: YourCabinetRouter?
    weak var view: YourCabinetController?
    
    func checkAuth(view: UIViewController){
        router?.presentLogin(view: view)
    }
    
    
}
