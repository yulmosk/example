//
//  AboutController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 17/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class AboutController: UIViewController {
    
    let controllerNibName = "AboutController"
    init() {
        super.init(nibName: controllerNibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func closeTapped(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
    }
}
