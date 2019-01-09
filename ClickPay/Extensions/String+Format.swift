//
//  String+Format.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 05/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation

extension String {
    static func minifiedFrom(contentOf path: String) throws -> String {
        let content = try String(contentsOfFile: path)
        return content.components(separatedBy: .newlines).joined()
    }
}
