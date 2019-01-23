//
//  Response.swift
//  ClickPay
//
//  Created by Denis Sancov on 14/05/2018.
//  Copyright © 2018 Cyber Whale. All rights reserved.
//

import AEXML
import XMLParsing

public enum ResponseDecode: Error {
    case invalidData
    case invalidXmlSchema
}

public struct Response<T: RootResponseModel> {
    public let code: Code
    public let message: String?
    public let result: T?
    
    init(from data: Data) throws {
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
        
        
        guard let bodyEl = document.firstDescendant(where: {
            T.canDecodeElement(with: $0.name, attributes: $0.attributes)
        }) else {
            result = nil
            return
        }
        
        guard let bodyData = bodyEl.xml.data(using: .utf8) else {
            result = nil
            return
        }
        
        let decoder = XMLDecoder()
        result = try decoder.decode(T.self, from: bodyData)
    }
}

public enum Code: Int, Error {
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
}

