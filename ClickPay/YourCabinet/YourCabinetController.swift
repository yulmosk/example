//
//  SecondViewController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 26/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import UIKit

class YourCabinetController: GradientViewController, UIScrollViewDelegate {

    var presenter: YourCabinetPresenter?
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameField: RegisterField!
    @IBOutlet weak var phoneField: RegisterField!
    @IBOutlet weak var emailField: RegisterField!    
    @IBOutlet weak var passwordField: RegisterField!
    
     var fields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        YourCabinetRouter.createYourCabinetModule(viewController: self)
        showCardBarItem(true)
        editFieldsSetUp()
        //presenter?.checkAuth(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.contentSize.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }


}

