//
//  MakeTransferWireFrame.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 29/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class MainRouter {
    
    func pushToTransferForm(formIndex: Int, view: UIViewController) {
        let viewController = TransferController.init()
        viewController.formIndex = formIndex
        view.navigationController?.pushViewController(viewController, animated: true)
        
        //TransferWireFrame.createTransferModule(formIndex: Int, viewController:viewController)
    }
    
    class func createMainModule(viewController: MainController) {
        let presenter = MainPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MainRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MainInteractor()
        viewController.presenter?.interactor?.presenter = presenter
    }
}
