//
//  EditFieldsLogic.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 17/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

extension YourCabinetController{
    
    func editFieldsSetUp(block:@escaping (CGFloat) -> Void){
        super.keyboardSetup(block:block)
        fields = [nameField,phoneField,emailField,passwordField]
    }
    
    
   func addGradient() {
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red: 244/255, green: 244/255, blue: 246/255, alpha: 1).cgColor, UIColor(red: 194/255, green: 192/255, blue: 213/255, alpha: 1).cgColor]
        gradientLayer.locations = [0.3, 1.0]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

