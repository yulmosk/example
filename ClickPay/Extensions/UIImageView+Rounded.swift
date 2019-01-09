//
//  UIView+Rounded.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 09/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class RoundedView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2.0
    }
    
}

