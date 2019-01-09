//
//  CardView.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 28/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    override func draw(_ rect: CGRect) {
         self.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 8)
    }
}
