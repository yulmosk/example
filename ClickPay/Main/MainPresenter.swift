//
//  MakeTransferPresenter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 29/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter {
    var router: MainRouter?
    weak var view: MainController?
    var interactor: MainInteractor?
    
    func showTransferForm(formIndex: Int, view: UIViewController) {
        router?.pushToTransferForm(formIndex: formIndex, view: view)
    }
}
