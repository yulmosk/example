//
//  TransferRouter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 23/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation

class TransferRouter {
    
    class func createTransferModule(viewController: TransferController) {
        let presenter = TransferPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = TransferRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = TransferInteractor()
        viewController.presenter?.interactor?.presenter = presenter
    }
}




