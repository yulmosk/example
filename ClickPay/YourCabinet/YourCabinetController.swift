//
//  SecondViewController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 26/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import UIKit

class YourCabinetController: FormController, UIScrollViewDelegate {

    var presenter: YourCabinetPresenter?
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameField: RegisterField!
    @IBOutlet weak var phoneField: RegisterField!
    @IBOutlet weak var emailField: RegisterField!    
    @IBOutlet weak var passwordField: RegisterField!
    
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        YourCabinetRouter.createYourCabinetModule(viewController: self)
        self.navigationController?.navigationBar.setGradientBackground(colors: [UIColor.light().cgColor,UIColor.dark().cgColor])
        showNavbarLogo(true)
        editFieldsSetUp { [weak self] shift in
            if var insets = self?.scrollView.contentInset, let viewHeigh = self?.view.bounds.height {
                insets.bottom = viewHeigh - shift
                self?.scrollView.contentInset = insets
                self?.scrollView.scrollIndicatorInsets = insets
            }
        }
        //presenter?.checkAuth(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addGradient()
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.contentSize.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }


}

