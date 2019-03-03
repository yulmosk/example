//
//  Request.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 23/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import AEXML

public struct Request {
    let host: String
    let headers: [String: String]
    let envelope: String
    
    public init<T: SoapOperation>(_ host: String, operation: T) {
        self.host = host
        
        let name = operation.operationTitle()
        let document = AEXMLDocument()
        
        let attributes = [
            "xmlns:soapenv": "http://schemas.xmlsoap.org/soap/envelope/",
            "xmlns:tem": "http://tempuri.org/"
        ]
        let envelopeElement = document.addChild(
            name: "soapenv:Envelope", attributes: attributes
        )
        envelopeElement.addChild(name: "soapenv:Header")
        
        let bodyElement = envelopeElement.addChild(name: "soapenv:Body")
        let actionElement = bodyElement.addChild(name: "tem:\(name)")
        
        let capitalize = operation.normalizeRequestArgs()
        
        let mirror = Mirror(reflecting: operation)
        for (property, value) in mirror.children {
            guard var property = property else { continue }
            
            if capitalize {
                property.capitalizeFirstLetter()
            }
            actionElement.addChild(
                name: "tem:\(property)",
                value: String(describing: value)
            )
        }
        self.envelope = document.xmlCompact
        print(self.envelope)
        
        self.headers = [
            "Content-Type": "text/xml; charset=utf-8",
            "Content-Length": String(self.envelope.count),
            "SOAPAction": "http://tempuri.org/IClickPayService/\(name)"
        ]
    }
}
