//
//  UITextField+Icon.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 01/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setLeftIcon(imageName:String, placeholder: String) {
        let imageView = UIImageView();
        let image = UIImage(named: imageName);
        imageView.image = image;
        imageView.frame = CGRect(x: 12, y: 13, width: 24, height: 24)
        self.addSubview(imageView)
        let leftView = UIView()
        leftView.frame = CGRect(x:12, y:0,width: 38,height: 50)
        self.leftView = leftView;
        self.leftViewMode = .always
        self.placeholder = placeholder
    }
}
