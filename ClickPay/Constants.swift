//
//  Constants.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 28/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    static let tabTitles = ["Tab.Transfer", "Tab.Cabinet", "Tab.History", "Tab.Menu"]
    
    static let transferInfo:[[String:String]] = [["image":"ToCard","title":"Transfer.ToCard"],["image":"ToMobile","title":"Transfer.ToMobile"],["image":"ToEmail","title":"Transfer.ToEmail"]]
    
    static let forms = ["Card","Phone","Email"]
    static let items = ["Main","Cabinet","History","Menu"]
    
    class func calculatedHeight() -> Int {
        var height = 68
        if Constants.heightIPhoneX.contains(UIScreen.main.nativeBounds.height)  {
            height += 40
        }
        return height
    }
    
    class func getLang() -> String{
        if let lang = Locale.current.languageCode, lang == "ru" {
            return lang
        }
        return "ro"
    }
    
    static let heightIPhoneX:Set<CGFloat> = [1792,2436,2688]
    static let scriptjs = "var meta = document.createElement('meta');" +
        "meta.name = 'viewport';" +
        "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';" +
        "var head = document.getElementsByTagName('head')[0];" + "head.appendChild(meta);"
    static let endPoint = "https://46.55.111.156/ClickPayService/Service.svc?wsdl"
}
