//
//  MenuPresenter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 17/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

enum Links:Int {
    case about = 0, cards, security, contact, settings
}

class MenuPresenter {
    var router: MenuRouter?
    weak var view: MenuController?
    var tabsView: UITabBarController?
    var selectedViewController: UIViewController?
    
    
    func showMenuScreen(index:Int){
        //viewController.dismiss(animated: false, completion: nil)
        var controller:UIViewController?
        switch index {
        case Links.about.rawValue:
            controller = AboutController.init()
        case Links.cards.rawValue:
            controller = CardsController.init()
        case Links.security.rawValue:
            controller = SecurityController.init()
        case Links.contact.rawValue:
            controller = ContactController.init()
        case Links.settings.rawValue:
            controller = SettingsController.init()
        default: ()
        }
        
        if let controller = controller {
            router?.openLink(controller: controller, view: view)
        }
    }
}
