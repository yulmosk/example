//
//  RegistreController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 01/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameField: RegisterField!
    @IBOutlet weak var surnameField: RegisterField!
    @IBOutlet weak var phoneField: RegisterField!
    @IBOutlet weak var emailField: RegisterField!
    @IBOutlet weak var passwordField: RegisterField!
    @IBOutlet weak var repeatField: RegisterField!
    
    @IBOutlet weak var capchaField: RegisterField!
    @IBOutlet weak var capchaLbl: UILabel!    
    @IBOutlet weak var capchaBtn: UIButton!
    
    var presenter: RegisterPresenter?
    var tabIndex = 0
    var fields = [UITextField]()

    let controllerNibName = "RegisterController"
    init() {
        super.init(nibName: controllerNibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerFieldsSetUp()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    @IBAction func registerTapped(_ sender: UIButton) {
        self.presenter?.registerTapped(index: self.tabIndex)
    }
    
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
