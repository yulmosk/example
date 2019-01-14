//
//  RegistreController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 01/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet weak var userFields: UIView!
    
    var presenter: RegisterPresenter?
    var tabIndex = 0

    let controllerNibName = "RegisterController"
    init() {
        super.init(nibName: controllerNibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    @IBAction func registerTapped(_ sender: UIButton) {
        self.presenter?.registerTapped(index: self.tabIndex)
    }
    
}
