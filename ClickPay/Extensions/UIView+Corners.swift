//
//  UIView+Corners.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 28/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
