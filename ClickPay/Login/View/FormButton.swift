//
//  FormView.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 01/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class FormButton: UIButton{
    
    override func draw(_ rect: CGRect) {
        self.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 4)
    }
}
