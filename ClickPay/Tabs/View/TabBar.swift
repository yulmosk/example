//
//  TabBar.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 27/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import UIKit

class TabBar: UITabBar {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        
        if let items = items {
            let itemWidth = UIScreen.main.bounds.size.width / CGFloat(items.count)
            
            for i in 0..<items.count {
                let item = items[i]
                if let view = item.value(forKey: "view") as? UIView {
                    view.frame = CGRect(x: view.frame.minX,y: view.frame.minY, width:itemWidth,height:view.frame.height )

                    if let label = view.subviews[1] as? UILabel{
                        label.frame = CGRect(x: label.frame.minX,y: label.frame.minY, width:itemWidth,height:label.frame.height )
                        label.lineBreakMode = .byWordWrapping
                        label.numberOfLines = 0
                        label.text = Constants.tabTitles[i].localized 
                        label.textAlignment = .center
                        label.sizeToFit()
                    }
                }
            }
        }
    }
  
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = CGFloat(Constants.calculatedHeight())
        return sizeThatFits
    }
}
