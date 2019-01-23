//
//  RootResponseModel.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 23/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation

public protocol RootResponseModel: Codable {
    static func canDecodeElement(with tag: String, attributes: [String: String]) -> Bool
}
