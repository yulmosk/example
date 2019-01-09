//
//  UIViewController+SSL.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 02/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation

extension TransferController{
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodClientCertificate) {
            completionHandler(.rejectProtectionSpace, nil)
        }
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
            let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(.useCredential, credential)
        }
    }
}
