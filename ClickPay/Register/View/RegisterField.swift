//
//  UserFielf.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 13/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class RegisterField: UITextField {
    
    override func draw(_ rect: CGRect) {
        
    }

    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by:padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by:padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by:padding)
    }
}

