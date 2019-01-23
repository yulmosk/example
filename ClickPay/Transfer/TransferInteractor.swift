//
//  TransferInteractor.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 23/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation

class TransferInteractor {
    weak var presenter: TransferPresenter?
    
    func getForm<T: SoapOperation>(operation: T){
        presenter?.showActivityIndicator(true)
        executeSoap(operation, dispatchMain: true) { (response, error) in
            guard let response = response else {
                self.presenter?.showActivityIndicator(true)
                return
            }
            
            if let error = error {
                self.presenter?.showErrorInfo(message: error.localizedDescription)
            } else {
                self.presenter?.loadForm(htmlString: response.message!)
            }
            
        }
    }
    
}
