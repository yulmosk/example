//
//  UserNotificationsView.swift
//  FinComBank
//
//  Created by Denis Sancov on 27/05/2018.
//  Copyright © 2018 Cyber Whale. All rights reserved.
//

import UIKit

final class UserNotificationsView: UIControl {
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "IconNotifications"))
        imageView.contentMode = .center
        imageView.tintColor = UIColor.init(rgb: 0x727272)
        return imageView
    }()
    
    private let labelCounter: UILabel = {
        let label = UILabel.init()
        //label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.point()
        label.clipsToBounds = true
        label.isHidden = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCommon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCommon()
    }
    
    public func setNotificationsCount(_ count: Int32, animated: Bool = false) {
        //labelCounter.text = "\(count)"
        
        let hidden = count <= 0
        
        if labelCounter.isHidden == hidden {
            return
        }
        
        if animated == false {
            labelCounter.isHidden = hidden
        } else {
            UIView.transition(
                with: labelCounter,
                duration: 0.3,
                options: [.transitionCrossDissolve, .beginFromCurrentState],
                animations: {
                    self.labelCounter.isHidden = hidden
            },
                completion: nil
            )
        }
    }
    
    
    private func initCommon() {
        addSubview(imageView)
        addSubview(labelCounter)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.bounds
        
        var rect = labelCounter.frame
        rect.size.width = 5 //18
        rect.size.height = 5 //18
        rect.origin.x = self.bounds.width - 12 //rect.size.width
        rect.origin.y = 9
        labelCounter.frame = rect
        labelCounter.layer.cornerRadius = rect.width / 2
    }
    
    override var isHighlighted: Bool {
        didSet {
            if oldValue == isHighlighted { return }
            
            UIView.animate(
                withDuration: 0.6,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 0,
                options: [.allowUserInteraction, .beginFromCurrentState],
                animations: {
                    self.alpha = (self.isHighlighted) ? 0.3 : 1
            },
                completion: nil
            )
        }
    }
}
