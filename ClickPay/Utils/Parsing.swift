//
//  Parsing.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 02/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import AEXML

func xmlParse(from data:Data) throws -> (Code,String?) {
    var code: Code = Code.exception
    var message: String? = ""
    
    let document = try AEXMLDocument(xml: data)
    
    print("got \(document.xml)")
    
    var tmpCode = Code.exception
    
    if let codeEl = document.firstDescendant(where: { $0.name == "a:Code"}) {
        if let tmp = Code(rawValue: Int(codeEl.string)!) {
            tmpCode = tmp
        }
    }
    code = tmpCode
    
    if let messageEl = document.firstDescendant(where: { $0.name == "a:Message"}) {
        message = messageEl.string
    } else {
        message = nil
    }
    
    return (code, message)
}

/*public enum Code: Int, Error {
    case success = 0
    case exception = -1
    case authAccountDisable = 1
    case authInvalidIsBlockedA = 2
    case authInvalidWasBlocked = 3
    case authInvalidNotPassedControl = 4
    case authInvalidLogin = 5
    case authInvalidPassword = 6
    case authPasswordExpired = 7
    case balInvalidPanLength = 8
    case balInvalidMonthB = 9
    case balInvalidYearB = 10
    case pgpCryptoService = 11
    case sqlError = 12
    case databaseError = 13
    case networkError = 14
    case pncError = 15
    case debitRequest = 16
    case cftRequest = 17
    case creditRequest = 18
    case suspectedFraud = 19
    case failed = 20
    case authOneTimePasswordExpired = 21
    case lostSession = 22
    case balanceRequest = 23
    case invalidTicket = 24
    case dublicateLogin = 51
}*/

