//
//  UIViewController+PopUps.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 08/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showConfirm(message: String, leftTitle: String, rightTitle: String, complete:((String) -> Void)?){
        
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: leftTitle, style: .default, handler: { (alert: UIAlertAction!) in
            complete?("left")
        }))
        alert.addAction(UIAlertAction(title: rightTitle, style: .default, handler: { (alert: UIAlertAction!) in
            complete?("right")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showInfo(message: String, bottomTitle:String, complete:(() -> Void)?){
        
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: bottomTitle, style: .default, handler: { (alert: UIAlertAction!) in
            complete?()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
