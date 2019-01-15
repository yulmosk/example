//
//  RegisterPresenter.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 10/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import Foundation
import UIKit

class RegisterPresenter {
    var router: RegisterRouter?
    weak var view: RegisterController?
    var tabsView: UITabBarController?
    
    
    func registerTapped(index:Int){
        router?.openTab(index: index, tabController: tabsView)
    }
    
    func refreshTapped(){
        UIView.animate(withDuration: 0.2, delay: 0.1, options: UIView.AnimationOptions.curveEaseIn, animations: {
            //self.rightBarButton.customView?.transform = (self.rightBarButton.customView?.transform.rotated(by: CGFloat(Double.pi)))!
        }, completion: nil)
    }

}
