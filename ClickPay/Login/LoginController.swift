//
//  LoginController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 01/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class LoginController: FormController {
    
    var presenter: LoginPresenter?
    var tabIndex = 0
    var moved = false
    var keyboardShift:CGFloat = 0
    
    @IBOutlet weak var checkLine: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let controllerNibName = "LoginController"
    init() {
        super.init(nibName: controllerNibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginFieldsSetUp { [weak self] shift in
            if var insets = self?.scrollView.contentInset, let viewHeigh = self?.view.bounds.height {
                insets.bottom = viewHeigh - shift
                self?.scrollView.contentInset = insets
                self?.scrollView.scrollIndicatorInsets = insets
            }
        }
    }
    
        
    @IBAction func loginTapped(_ sender: UIButton) {
        self.presenter?.loginTapped(index: self.tabIndex)
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: {
            self.presenter?.showRegister(view:self,index: self.tabIndex)
        })
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
