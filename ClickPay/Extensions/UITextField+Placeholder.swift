//
//  UITextField+Placeholder.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 14/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    @IBInspectable var placeholderColor: UIColor {
        get {
            return self.attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? .lightText
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [.foregroundColor: newValue])
        }
    }
}

