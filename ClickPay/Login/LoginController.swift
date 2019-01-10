//
//  LoginController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 01/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    var presenter: LoginPresenter?
    var tabIndex = 0
    
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
        loginTextField.setLeftIcon(imageName: "Login", placeholder: NSLocalizedString("Login", comment: ""))
        passwordTextField.setLeftIcon(imageName: "Password", placeholder: NSLocalizedString("Password", comment: ""))
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        self.presenter?.loginTapped(index: self.tabIndex)
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        dismiss(animated: false, completion: {
            self.presenter?.showRegister(view:self,index: self.tabIndex)
        })
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
