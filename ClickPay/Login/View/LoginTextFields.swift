//
//  LoginTextFields.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 15/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

enum fieldTag:Int{
    case login = 1
    case password = 2
}

extension LoginController: UITextFieldDelegate {
    
    func loginFieldsSetUp(){
        loginTextField.setLeftIcon(imageName: "Login", placeholder: NSLocalizedString("Login", comment: ""))
        passwordTextField.setLeftIcon(imageName: "Password", placeholder: NSLocalizedString("Password", comment: ""))
        passwordTextField.isSecureTextEntry = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardWillHideNotification , object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == fieldTag.login.rawValue {
            passwordTextField.becomeFirstResponder()
        }
        if textField.tag == fieldTag.password.rawValue {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @objc func keyboardDidShow(notification: Notification){
        guard let userInfo = notification.userInfo else { return }
        
        if keyboardShift == 0.0 {
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            keyboardShift = Constants.calculateKeyboardLoginShift(checkLine: checkLine.constant, keyboardHeight: keyboardFrame.height)
        }
        if moved || keyboardShift == 0.0 { return }
        moved = true
        animateViewMoving(up: true,moveValue: keyboardShift)
    }
    
    @objc func keyboardDidHide(notification: Notification){
        if !moved || keyboardShift == 0.0 { return }
        moved = false
        animateViewMoving(up: false,moveValue: keyboardShift)
    }
    
    @objc func closeKeyboard(){
         self.view.endEditing(true)
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.1
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
}
