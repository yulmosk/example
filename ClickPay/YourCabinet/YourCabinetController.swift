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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        YourCabinetRouter.createYourCabinetModule(viewController: self)
        presenter?.checkAuth(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }


}

