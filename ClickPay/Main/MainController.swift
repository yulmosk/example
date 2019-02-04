//
//  FirstViewController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 26/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import UIKit

class MainController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        MainRouter.createMainModule(viewController: self)
        showCardBarItem(true)
    }
    
}

extension MainController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! MakeTransferCell
        cell.fill(index:indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.transferInfo.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showTransferForm(formIndex: indexPath.row, view: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    
    func testPopup(){
        
         let actions = [
            PopupAction(title: "Popup.Action.Confirm".localized) {  [weak self]  in
                guard let vc = self else { return }
                vc.dismiss(animated: true)
         },
            PopupAction(title: "Popup.Action.Deny".localized) {  [weak self]  in
                guard let vc = self else { return }
                vc.dismiss(animated: true)
         }
         ]
 
        let action = PopupAction(title: "OK") { [weak self]  in
            guard let vc = self else { return }
            vc.dismiss(animated: true)
        }

        PopupController.showPopup(message: "test", actions: actions, on: self)
    }
    
}


