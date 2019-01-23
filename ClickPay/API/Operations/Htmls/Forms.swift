//
//  Forms.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 23/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation

struct P2P_RequestMob {
    let clientId: Int64
    let paymentDestination: String
    let lang: String
    let ip: String
}

extension P2P_RequestMob: SoapOperation {
    typealias Result = Response
    
    struct Response: RootResponseModel {
        static func canDecodeElement(
            with tag: String,
            attributes: [String : String])
            -> Bool
        {
            return tag == "Не важно"
        }
    }
}

