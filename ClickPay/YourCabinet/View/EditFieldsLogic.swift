//
//  EditFieldsLogic.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 17/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

extension YourCabinetController: UITextFieldDelegate {
    
    func editFieldsSetUp(){
        fields = [nameField,phoneField,emailField,passwordField]
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardWillHideNotification , object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardDidShow(notification: Notification){
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height:  keyboardFrame.height + 554.0)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
        
    }
    
    @objc func keyboardDidHide(notification: Notification){
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 554.0)
    }
    
    @objc func closeKeyboard(){
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let point:CGPoint = textField.frame.origin
        scrollView.contentOffset = point
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

