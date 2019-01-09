//
//  UIColor+AppColors.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 08/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

extension UIColor {
    class func primary() -> UIColor {
        return UIColor(rgb: 0x95238d)
    }
    
    class func pink() -> UIColor {
        return UIColor(rgb: 0xbc23a0)
    }
    
    class func blue() -> UIColor {
        return  UIColor(rgb: 0x0076c1)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
