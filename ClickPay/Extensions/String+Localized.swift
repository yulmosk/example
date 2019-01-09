//
//  String+Localized.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 04/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
