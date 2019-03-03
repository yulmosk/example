//
//  UIViewController+KeyBoard.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 03/03/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

extension UIViewController {
    private enum AssociatedKeys {
        static var keyboardObserverKey: NSObjectProtocol?
    }
    
    private var keyboardObserver: NSObjectProtocol? {
        get {
            var key = AssociatedKeys.keyboardObserverKey
            return objc_getAssociatedObject(self, &key) as? NSObjectProtocol
        }
        set {
            var key = AssociatedKeys.keyboardObserverKey
            let policy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            objc_setAssociatedObject(
                self, &key, newValue as NSObjectProtocol?, policy
            )
        }
    }
    
    @IBAction public func dismissKeyboard(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    public func registerKeyboardObserver(with block:@escaping (CGRect, CGRect) -> Void) {
        guard keyboardObserver == nil else { return }
        
        let handler:(Notification) -> Void = { [weak self] notif in
            guard let params = notif.userInfo, let strongSelf = self else {
                return
            }
            strongSelf.animate(block, using: params)
        }
        
        keyboardObserver = NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillChangeFrameNotification,
            object: nil,
            queue: nil,
            using: handler
        )
    }
    
    public func removeKeyboardObserver() {
        guard let observer = keyboardObserver else { return }
        
        NotificationCenter.default.removeObserver(
            observer, name: UIResponder.keyboardWillChangeFrameNotification, object: nil
        )
        
        keyboardObserver = nil
    }
    
    private func animate(_ block: (CGRect, CGRect) -> Void, using params: [AnyHashable: Any]) {
        guard let beginRect = params[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect,
            let endRect = params[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let duration = params[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
            let curveRaw = params[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int,
            let curve = UIView.AnimationCurve(rawValue: curveRaw)
            else {
                return
        }
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationCurve(curve)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        block(beginRect, endRect)
        
        UIView.commitAnimations()
    }
}

