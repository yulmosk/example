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

extension LoginController{
    
    func loginFieldsSetUp(block:@escaping (CGFloat) -> Void){
        super.keyboardSetup(block:block)
        fields = [loginTextField,passwordTextField]
        loginTextField.setLeftIcon(imageName: "Login", placeholder: NSLocalizedString("Login", comment: ""))
        passwordTextField.setLeftIcon(imageName: "Password", placeholder: NSLocalizedString("Password", comment: ""))
        passwordTextField.isSecureTextEntry = true
    }
    
    
}
