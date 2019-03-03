//
//  RegisterTextFields.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 15/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

extension RegisterController {
    
    func registerFieldsSetUp(block:@escaping (CGFloat) -> Void){
        super.keyboardSetup(block:block)
        fields = [nameField,surnameField,phoneField,emailField,passwordField,repeatField, capchaField]
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let point:CGPoint
        if textField.tag == 106 {
            point = repeatField.frame.origin
        } else {
           point = textField.frame.origin
        }
        scrollView.contentOffset = point
    }
}
