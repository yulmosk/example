//
//  FormController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 03/03/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class FormController: UIViewController, UITextFieldDelegate {
    
     var fields = [UITextField]()
     var block:((CGFloat) -> Void)?
    
    func keyboardSetup(block:@escaping (CGFloat) -> Void){
        
        self.block = block
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardWillHideNotification , object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func keyboardDidShow(notification: Notification){
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        block?(keyboardFrame.minY)
    }
    
    @objc func keyboardDidHide(notification: Notification){
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        block?(keyboardFrame.minY)
    }
    
    @objc func closeKeyboard(){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if var index = fields.index(of: textField) {
            index += 1
            if index == fields.count {
                textField.resignFirstResponder()
            } else {
                let nextTextFiled = fields[index]
                nextTextFiled.becomeFirstResponder()
            }
        } else {
            return false
        }
        return true
    }
        
    
}
