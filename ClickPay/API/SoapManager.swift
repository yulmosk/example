//
//  SoapManager.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 23/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation

class SoapManager: NSObject, URLSessionDelegate{
    static let shared = SoapManager()
    override init(){}
    
        
    public func execute<T: RootResponseModel>(
        _ request: Request,
        on complete: @escaping (Response<T>?, Error?) -> Void)
    {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration:config, delegate: self, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: URLRequest(request)) { (data, response, error) in
            print("ответ \(response)")
            if let err = error {
                print("error \(err)")
                complete(nil, err)
                return
            }
            
            do {
                let response = try Response<T>(from: data!)
                complete(response, nil)
            } catch {
                print("error on parse \(error)")
                complete(nil, error)
            }
        }
        task.resume()
    }
    
    
    
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
    

    


extension URLRequest {
    init(_ request: Request) {
        self.init(url: URL.init(string: request.host)!)
        
        allHTTPHeaderFields = request.headers
        httpMethod = "POST"
        httpBody = request.envelope.data(using: .utf8)
    }
}

