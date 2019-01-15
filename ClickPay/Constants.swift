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
    static let menuWidth = CGFloat(220.0)
    
    static let menuInfo:[[String:String]] = [["image":"About","title":"Menu.About"],["image":"Cards","title":"Menu.Cards"],["image":"Security","title":"Menu.Security"],
        ["image":"Contact","title":"Menu.Contact"],
        ["image":"Settings","title":"Menu.Settings"]]
    
    class func calculatedHeight() -> Int {
        var height = 68
        if Constants.heightIPhoneX.contains(UIScreen.main.nativeBounds.height) || UIScreen.main.nativeBounds.height > 2000 {
            height += 40
        }
        return height
    }
    
    class func calculatedTopMenu() -> CGFloat {
        var top = 10
        if Constants.heightIPhoneX.contains(UIScreen.main.nativeBounds.height)  {
            top += 40
        }
        return CGFloat(top)
    }
    
    class func getLang() -> String{
        if let lang = Locale.current.languageCode, lang == "ru" {
            return lang
        }
        return "ro"
    }
    
    class func calculateKeyboardLoginShift(checkLine:CGFloat, keyboardHeight: CGFloat) -> CGFloat{
        let delta = UIScreen.main.bounds.height - checkLine
        if keyboardHeight > delta {
            return keyboardHeight - delta
        }
     return 0.0
    }
    
    static let heightIPhoneX:Set<CGFloat> = [1792,2436,2688]
    static let scriptjs = "var meta = document.createElement('meta');" +
        "meta.name = 'viewport';" +
        "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';" +
        "var head = document.getElementsByTagName('head')[0];" + "head.appendChild(meta);"
    static let endPoint = "https://46.55.111.156/ClickPayService/Service.svc?wsdl"
}
