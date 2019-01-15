//
//  CapchaLabel.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 15/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class CapchaLabel: UILabel {
    override func draw(_ rect: CGRect) {
        self.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 4)
    }

}
