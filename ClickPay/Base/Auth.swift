//
//  Auth.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 17/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation

class Auth{
    static let shared = Auth()
    init(){}
    
    var ticket: String? = nil
    
    func saveTicket(ticket: String){
        self.ticket = ticket
    }
    
    func isAuth() -> Bool {
        if let _ = ticket {
            return true
        }
        
        return false
    }
}
