//
//  TransferPresenter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 23/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class TransferPresenter {
    var router: TransferRouter?
    weak var view: TransferController?
    var interactor: TransferInteractor?
    
    func loadForm(formIndex: Int){
        //Создаем операцию
        let clientId = 0
        let paymentDestination = Constants.forms[formIndex]
        let lang = Constants.getLang()
        let  ip = getWiFiAddress() ?? "unavailable"
        
        let operation = P2P_RequestMob(clientId: Int64(clientId), paymentDestination: paymentDestination, lang: lang, ip: ip)
        interactor?.getForm(operation: operation)
    }
    
    func showActivityIndicator(_ show: Bool){
        view?.showActivityIndicator(show)
    }
    
    func showErrorInfo(message: String){
        view?.showErrorInfo(message: message)
    }
    
    func loadForm(htmlString: String){
        view?.loadForm(htmlString: htmlString)
    }
    
}
